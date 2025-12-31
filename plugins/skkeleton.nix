{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.plugins.skkeleton;
in
{
  options.plugins.skkeleton = {
    enable = lib.mkEnableOption "skkeleton";

    settings = {
      acceptIllegalResult = lib.mkOption {
        default = null;
        type = lib.types.nullOr lib.types.bool;
      };

      completionRankFile = lib.mkOption {
        default = null;
        type = lib.types.nullOr lib.types.str;
      };

      databasePath = lib.mkOption {
        default = null;
        type = lib.types.nullOr lib.types.str;
      };

      debug = lib.mkOption {
        default = null;
        type = lib.types.nullOr lib.types.bool;
      };

      eggLikeNewline = lib.mkOption {
        default = null;
        type = lib.types.nullOr lib.types.bool;
      };

      globalDictionaries = lib.mkOption {
        default = null;
        type = lib.types.nullOr (
          lib.types.listOf (
            lib.types.oneOf [
              lib.types.path
              lib.types.str
              (lib.types.listOf (lib.types.either lib.types.path lib.types.str))
            ]
          )
        );
      };

      globalKanaTableFiles = lib.mkOption {
        default = null;
        type = lib.types.nullOr (
          lib.types.listOf (lib.types.either lib.types.str (lib.types.listOf lib.types.str))
        );
      };

      immediatelyCancel = lib.mkOption {
        default = null;
        type = lib.types.nullOr lib.types.bool;
      };

      immediatelyDictionaryRW = lib.mkOption {
        default = null;
        type = lib.types.nullOr lib.types.bool;
      };

      immediatelyOkuriConvert = lib.mkOption {
        default = null;
        type = lib.types.nullOr lib.types.bool;
      };

      kanaTable = lib.mkOption {
        default = null;
        type = lib.types.nullOr lib.types.str;
      };

      keepMode = lib.mkOption {
        default = null;
        type = lib.types.nullOr lib.types.bool;
      };

      keepState = lib.mkOption {
        default = null;
        type = lib.types.nullOr lib.types.bool;
      };

      lowercaseMap = lib.mkOption {
        default = null;
        type = lib.types.nullOr (lib.types.attrsOf lib.types.str);
      };

      markerHenkan = lib.mkOption {
        default = null;
        type = lib.types.nullOr lib.types.str;
      };

      markerHenkanSelect = lib.mkOption {
        default = null;
        type = lib.types.nullOr lib.types.str;
      };

      registerConvertResult = lib.mkOption {
        default = null;
        type = lib.types.nullOr lib.types.bool;
      };

      selectCandidateKeys = lib.mkOption {
        default = null;
        type = lib.types.nullOr lib.types.str;
      };

      setUndoPoint = lib.mkOption {
        default = null;
        type = lib.types.nullOr lib.types.bool;
      };

      showCandidatesCount = lib.mkOption {
        default = null;
        type = lib.types.nullOr lib.types.int;
      };

      skkServerHost = lib.mkOption {
        default = null;
        type = lib.types.nullOr lib.types.str;
      };

      skkServerPort = lib.mkOption {
        default = null;
        type = lib.types.nullOr lib.types.int;
      };

      skkServerReqEnc = lib.mkOption {
        default = null;
        type = lib.types.nullOr lib.types.str;
      };

      skkServerResEnc = lib.mkOption {
        default = null;
        type = lib.types.nullOr lib.types.str;
      };

      sources = lib.mkOption {
        default = null;
        type = lib.types.nullOr (lib.types.listOf lib.types.str);
      };

      userDictionary = lib.mkOption {
        default = null;
        type = lib.types.nullOr lib.types.str;
      };
    };

    kanatables = lib.mkOption {
      default = { };
      type = lib.types.attrsOf (
        lib.types.submodule {
          options = {
            create = lib.mkOption {
              default = false;
              type = lib.types.bool;
            };

            table = lib.mkOption {
              type = lib.types.attrsOf (lib.types.either lib.types.str (lib.types.listOf lib.types.str));
            };
          };
        }
      );
    };

    package = lib.mkOption {
      default = pkgs.vimPlugins.skkeleton;
      type = lib.types.package;
    };
  };

  config = lib.mkIf cfg.enable {
    extraConfigLua =
      let
        skkeletonConfig = lib.generators.toLua { } (
          lib.attrsets.filterAttrs (_: value: value != null) cfg.settings
        );

        kanatables = lib.concatStringsSep "\n" (
          lib.attrsets.mapAttrsToList (
            name: value: # vim
            ''
              vim.fn['skkeleton#register_kanatable'](
                '${name}',
                ${lib.generators.toLua { } value.table},
                ${lib.generators.toLua { } value.create}
              )
            '') cfg.kanatables
        );
      in
      # lua
      ''
        ${kanatables}

        vim.fn['skkeleton#config'](${skkeletonConfig})
      '';

    extraPlugins = with pkgs.vimPlugins; [
      skkeleton
      denops-vim
    ];
  };
}
