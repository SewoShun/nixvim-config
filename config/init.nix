{ pkgs, ... }:
{
  extraPackages = with pkgs; [
    python313Packages.pylatexenc
    marksman
    imagemagick
  ];

  globals = {
    maplocalleader = "_";
  };

  opts = {
    number = true;
    relativenumber = true;
    tabstop = 2;
    shiftwidth = 2;
    expandtab = true;
    autoindent = true;
    smartindent = true;
  };

  diagnostic.settings = {
    virtual_text = false;
    virtual_lines.current_line = true;
  };

  colorschemes.catppuccin.enable = true;

  keymaps = [
    {
      key = "<leader><leader>";
      action = "<cmd>nohlsearch<cr>";
    }
    {
      key = "<esc><esc>";
      action = "<c-\\><c-n>";
      mode = [ "t" ];
    }
  ];
}
