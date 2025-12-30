{ pkgs, ... }:
{
  imports = [
    ./lsp
    ./skkeleton

    ./barbar.nix
    ./blink-cmp.nix
    ./claude-code.nix
    ./dap.nix
    ./dial.nix
    ./flash.nix
    ./mini.nix
    ./neorg.nix
    ./noice.nix
    ./treesitter.nix
    ./zk.nix
  ];

  extraPlugins = with pkgs.vimPlugins; [
    atone-nvim
    blink-indent
    denops-vim
    jj-nvim
    lazyjj-nvim
  ];

  extraConfigLua = ''
    require("atone").setup({})
    require("blink.indent").setup({})
    require("jj").setup({})
    require("lazyjj").setup({})
  '';

  plugins = {
    direnv.enable = true;
    hardtime.enable = true;
    hmts.enable = true;
    lualine.enable = true;
    muren.enable = true;
    nabla.enable = true;
    numbertoggle.enable = true;
    overseer.enable = true;
    render-markdown.enable = true;
    rustaceanvim.enable = true;
    web-devicons.enable = true;
    which-key.enable = true;
  };
}
