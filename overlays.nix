{
  inputs,
  lib,
  withSystem,
  ...
}:
{
  flake.overlays = {
    default =
      final: prev:
      withSystem prev.stdenv.hostPlatform.system (
        { config, ... }:
        {
          neovim = config.packages.default;
        }
      );
    extraVimPlugins =
      final: prev:
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
        extraVimPluginsPackages = lib.attrsets.mapAttrs' (
          name: src:
          (lib.attrsets.nameValuePair (lib.strings.removeSuffix "-src" "${name}") (
            prev.vimUtils.buildVimPlugin { inherit name src; }
          ))
        ) extraVimPluginsSrc;
      in
      {
        vimPlugins = prev.vimPlugins // extraVimPluginsPackages;
      };
  };
}
