{inputs', ...}: {
  home.packages = [
    inputs'.zen-browser.packages.beta
  ];
}
