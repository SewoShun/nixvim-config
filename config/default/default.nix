{ self, ... }:
{
  imports = [
    ./init.nix
    ./plugins
  ];

  nixpkgs = {
    overlays = [ self.overlays.extraVimPlugins ];
    config.allowUnfree = true;
  };
}
