{ lib, ... }:
let
  inherit (lib.nixvim) mkRaw;
in
{
  plugins.flash.enable = true;

  keymaps = [
    {
      action = mkRaw "function() require('flash').remote() end";
      key = "S";
      mode = [
        "n"
        "x"
        "o"
      ];
    }
  ];
}
