#define _GNU_SOURCE

#include <fcntl.h>
#include <grp.h>
#include <sched.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>

#define NS_PATH "/var/run/netns/ts-vpn"

static void die(const char *message) {
  perror(message);
  exit(EXIT_FAILURE);
}

static void usage(const char *program) {
  fprintf(stderr, "Usage: %s <command> [args...]\n", program);
  exit(EXIT_FAILURE);
}

int main(int argc, char *argv[]) {
  if (argc < 2) {
    usage(argv[0]);
  }

  /*
   * Because this program is setuid-root:
   *
   *   getuid()  = real user
   *   geteuid() = root
   *
   * Save the identity of the user who launched us before doing
   * anything privileged.
   */
  uid_t uid = getuid();
  gid_t gid = getgid();

  /*
   * Open exactly the namespace we are intended to enter.
   *
   * The user cannot choose an arbitrary namespace path.
   */
  int nsfd = open(NS_PATH, O_RDONLY | O_CLOEXEC);

  if (nsfd < 0) {
    die("open network namespace");
  }

  /*
   * Enter the network namespace while privileged.
   */
  if (setns(nsfd, CLONE_NEWNET) != 0) {
    die("setns");
  }

  if (close(nsfd) != 0) {
    die("close network namespace");
  }

  /*
   * Remove supplementary groups first.
   *
   * This prevents a user from retaining privileged group membership.
   */
  if (setgroups(0, NULL) != 0) {
    die("setgroups");
  }

  /*
   * Drop GID before dropping UID.
   */
  if (setgid(gid) != 0) {
    die("setgid");
  }

  /*
   * Permanently drop root.
   *
   * After this succeeds, the process must no longer have the ability
   * to regain root privileges.
   */
  if (setuid(uid) != 0) {
    die("setuid");
  }

  /*
   * Sanity check.
   */
  if (geteuid() == 0 || getegid() == 0) {
    fprintf(stderr, "failed to permanently drop privileges\n");
    return EXIT_FAILURE;
  }

  /*
   * Execute the requested program as the original user.
   */
  execvp(argv[1], &argv[1]);

  die("execvp");
}
