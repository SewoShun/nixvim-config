{ lib, ... }:
let
  inherit (lib.nixvim) mkRaw;
in
{
  plugins = {
    mini-ai.enable = true;
    mini-basics.enable = true;
    mini-bracketed.enable = true;
    mini-comment.enable = true;
    mini-cursorword.enable = true;
    mini-diff.enable = true;
    mini-extra.enable = true;
    mini-files = {
      enable = true;
      settings.windows.preview = true;
    };
    mini-git.enable = true;
    mini-hipatterns.enable = true;
    mini-icons.enable = true;
    mini-misc.enable = true;
    mini-move.enable = true;
    mini-operators.enable = true;
    mini-pairs.enable = true;
    mini-pick.enable = true;
    mini-splitjoin.enable = true;
    mini-surround.enable = true;
    mini-trailspace.enable = true;
    mini-visits.enable = true;
  };

  keymaps = [
    {
      action = "<cmd>Pick files<cr>";
      key = "<leader>ff";
      mode = "n";
    }
    {
      action = "<cmd>Pick grep_live<cr>";
      key = "<leader>fg";
      mode = "n";
    }
    {
      action = mkRaw "function() MiniFiles.open() end";
      key = "<leader>fF";
      mode = "n";
    }
    {
      action = mkRaw "function() MiniSplitjoin.toggle() end";
      key = "<leader>s";
      mode = "n";
    }
  ];
}
