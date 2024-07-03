{pkgs, ...}: {
  home.packages = with pkgs; [
    # steam
    # osu-lazer

    glfw-wayland-minecraft
    prismlauncher
    fabric-installer
  ];
  home.file."lib/glfw-wayland-minecraft-libglfw".source = "${pkgs.glfw-wayland-minecraft}/lib";
}
