{
  inputs,
  lib,
  ...
}:
let
  extraVimPluginsSrc = {
    inherit (inputs)
      blink-cmp-skkeleton-src
      atone-nvim-src
      jj-nvim-src
      lazyjj-nvim-src
      skkeleton-src
      ;
  };
  extraVimPluginsPackages =
    pkgs:
    lib.attrsets.mapAttrs' (
      name: src:
      (lib.attrsets.nameValuePair (lib.strings.removeSuffix "-src" "${name}") (
        pkgs.vimUtils.buildVimPlugin { inherit name src; }
      ))
    ) extraVimPluginsSrc;

  extraVimPluginsOverlay = final: prev: {
    vimPlugins = prev.vimPlugins // extraVimPluginsPackages prev;
  };
in
{
  flake.overlays = {
    extraVimPlugins = extraVimPluginsOverlay;
  };
}
