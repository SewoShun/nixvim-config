{ lib, ... }:
let
  inherit (lib.nixvim) mkRaw;
in
{
  plugins.dial = {
    enable = true;
    luaConfig.post = ''
      local augend = require("dial.augend")
      require("dial.config").augends:register_group({
        default = {
          augend.integer.alias.decimal,
          augend.integer.alias.hex,
          augend.integer.alias.binary,
          augend.constant.alias.bool,
          augend.constant.alias.Bool,
          augend.date.alias["%Y/%m/%d"],
        }
      })
    '';

  };

  keymaps = [
    {
      action = mkRaw ''function() require("dial.map").manipulate("increment", "normal") end'';
      key = "<c-a>";
      mode = "n";
    }
    {
      action = mkRaw ''function() require("dial.map").manipulate("decrement", "normal") end'';
      key = "<c-x>";
      mode = "n";
    }
    {
      action = mkRaw ''function() require("dial.map").manipulate("increment", "gnormal") end'';
      key = "g<c-a>";
      mode = "n";
    }
    {
      action = mkRaw ''function() require("dial.map").manipulate("decrement", "gnormal") end'';
      key = "g<c-x>";
      mode = "n";
    }
    {
      action = mkRaw ''function() require("dial.map").manipulate("increment", "visual") end'';
      key = "<c-a>";
      mode = "x";
    }
    {
      action = mkRaw ''function() require("dial.map").manipulate("decrement", "visual") end'';
      key = "<c-x>";
      mode = "x";
    }
    {
      action = mkRaw ''function() require("dial.map").manipulate("increment", "gvisual") end'';
      key = "g<c-a>";
      mode = "x";
    }
    {
      action = mkRaw ''function() require("dial.map").manipulate("decrement", "gvisual") end'';
      key = "g<c-x>";
      mode = "x";
    }
  ];
}
