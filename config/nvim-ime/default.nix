{ self, ... }:
{
  imports = [ ../default/plugins/skkeleton ];

  opts = {
    tabstop = 2;
    shiftwidth = 2;
    expandtab = true;
    autoindent = true;
    smartindent = true;
  };

  colorschemes.catppuccin.enable = true;

  nixpkgs = {
    overlays = [ self.overlays.extraVimPlugins ];
    config.allowUnfree = true;
  };
}
