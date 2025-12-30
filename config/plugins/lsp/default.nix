{
  imports = [
    ./lspsaga.nix
    ./none-ls.nix
  ];

  plugins = {
    lsp = {
      enable = true;
      inlayHints = true;
      servers = {
        clangd.enable = true;
        cmake.enable = true;
        cssls.enable = true;
        html.enable = true;
        java_language_server.enable = true;
        jsonls.enable = true;
        just.enable = true;
        kotlin_language_server.enable = true;
        lua_ls.enable = true;
        marksman.enable = true;
        nil_ls.enable = true;
        nixd.enable = true;
        pyright.enable = true;
        tailwindcss.enable = true;
        taplo.enable = true;
        yamlls.enable = true;
        zk.enable = true;
      };
    };

    lsp-format.enable = true;
  };
}
