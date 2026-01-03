{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    systems.url = "github:nix-systems/default";
    treefmt-nix.url = "github:numtide/treefmt-nix";
    nixvim.url = "github:nix-community/nixvim";

    atone-nvim-src.url = "github:XXiaoA/atone.nvim";
    atone-nvim-src.flake = false;
    blink-cmp-skkeleton-src.url = "github:Xantibody/blink-cmp-skkeleton";
    blink-cmp-skkeleton-src.flake = false;
    jj-nvim-src.url = "github:NicolasGB/jj.nvim";
    jj-nvim-src.flake = false;
    lazyjj-nvim-src.url = "github:swaits/lazyjj.nvim";
    lazyjj-nvim-src.flake = false;
    skkeleton-src.url = "github:vim-skk/skkeleton";
    skkeleton-src.flake = false;
  };

  outputs =
    inputs@{ self, flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {

      systems = import inputs.systems;

      imports = [
        inputs.treefmt-nix.flakeModule
        inputs.nixvim.flakeModules.default
        ./overlays.nix
      ];

      nixvim = {
        packages.enable = true;
        checks.enable = true;
      };

      flake.nixvimModules = {
        default = ./config/default;
        nvim-ime = ./config/nvim-ime;
      };

      perSystem =
        {
          pkgs,
          system,
          ...
        }:
        {
          nixvimConfigurations = {
            default = inputs.nixvim.lib.evalNixvim {
              inherit system;
              extraSpecialArgs = {
                inherit self;
              };
              modules = [
                self.nixvimModules.default
                ./plugins/default.nix
              ];
            };

            nvim-ime = inputs.nixvim.lib.evalNixvim {
              inherit system;
              extraSpecialArgs = {
                inherit self;
              };
              modules = [
                self.nixvimModules.nvim-ime
                ./plugins/default.nix
              ];
            };
          };

          devShells.default = pkgs.mkShell {
            buildInputs = with pkgs; [ vim-startuptime ];
          };

          treefmt = {
            projectRootFile = "flake.nix";
            programs = {
              nixfmt.enable = true;
            };
          };
        };
    };
}
