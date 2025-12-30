{
  plugins.neorg = {
    enable = true;
    settings = {
      load = {
        "core.defaults" = {
          __empty = null;
        };
        "core.completion" = {
          config = {
            engine = "nvim-cmp";
          };
        };
        "core.concealer" = {
          __empty = null;
        };
        "core.dirman" = {
          config = {
            workspaces = {
              notes = "~/neorg/notes";
            };
            default_workspace = "notes";
          };
        };
      };
    };
  };
}
