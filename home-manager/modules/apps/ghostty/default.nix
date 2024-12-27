{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    inputs.ghostty.packages."${system}".default
  ];
}
