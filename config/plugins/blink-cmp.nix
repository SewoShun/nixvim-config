{
  pkgs,
  lib,
  ...
}:
let
  inherit (lib.nixvim) mkRaw;
in
{
  extraPlugins = with pkgs.vimPlugins; [
    blink-cmp-skkeleton
  ];

  plugins = {
    blink-cmp = {
      enable = true;
      settings = {
        keymap = {
          "<c-e>" = [
            "hide"
            "fallback"
          ];
          "<c-y>" = [
            "accept"
            "fallback"
          ];
          "<cr>" = [
            "accept"
            "fallback"
          ];
          "<c-p>" = [
            "select_prev"
            "fallback"
          ];
          "<c-n>" = [
            "select_next"
            "fallback"
          ];
          "<c-u>" = [
            "scroll_documentation_up"
            "fallback"
          ];
          "<c-d>" = [
            "scroll_documentation_down"
            "fallback"
          ];
          "<c-k>" = [
            "show_signature"
            "hide_signature"
            "fallback"
          ];
          "<tab>" = [
            "snippet_forward"
            "fallback"
          ];
          "<s-tab>" = [
            "snippet_backward"
            "fallback"
          ];
        };
        completion = {
          documentation = {
            auto_show = true;
          };
          list.selection = {
            preselect = false;
          };
        };
        sources = {
          default = mkRaw ''
            function(ctx)
              if require("blink-cmp-skkeleton").is_enabled() then
                return { "skkeleton" }
              else
                return { "lsp", "path", "snippets", "buffer" }
              end
            end
          '';
          providers = {
            neorg = {
              name = "neorg";
              module = "blink.compat.source";
            };
            skkeleton = {
              name = "skkeleton";
              module = "blink-cmp-skkeleton";
            };
          };
        };
      };
    };

    blink-compat = {
      enable = true;
      settings = {
        impersonate_nvim_cmp = true;
      };
    };
  };
}
