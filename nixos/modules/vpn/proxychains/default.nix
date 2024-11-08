{...}: {
  programs.proxychains = {
    enable = true;
    proxies = {
      sslocal = {
        enable = true;
        type = "http";
        host = "127.0.0.1";
        port = 8082;
      };
    };
  };
}
