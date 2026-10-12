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

  uid_t uid = getuid();
  gid_t gid = getgid();

  int nsfd = open(NS_PATH, O_RDONLY | O_CLOEXEC);

  if (nsfd < 0) {
    die("open network namespace");
  }

  if (setns(nsfd, CLONE_NEWNET) != 0) {
    die("setns");
  }

  if (close(nsfd) != 0) {
    die("close network namespace");
  }

  if (setgroups(0, NULL) != 0) {
    die("setgroups");
  }

  if (setgid(gid) != 0) {
    die("setgid");
  }

  if (setuid(uid) != 0) {
    die("setuid");
  }

  if (geteuid() == 0 || getegid() == 0) {
    fprintf(stderr, "failed to permanently drop privileges\n");
    return EXIT_FAILURE;
  }

  execvp(argv[1], &argv[1]);

  die("execvp");
}
