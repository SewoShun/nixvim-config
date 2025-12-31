{
  pkgs,
  ...
}:
{
  imports = [ ./azik_kanatable.nix ];

  plugins.skkeleton = {
    enable = true;
    settings = {
      globalDictionaries = with pkgs.skkDictionaries; [
        "${l}/share/skk/SKK-JISYO.L"
        "${jinmei}/share/skk/SKK-JISYO.jinmei"
        "${fullname}/share/skk/SKK-JISYO.fullname"
        "${propernoun}/share/skk/SKK-JISYO.propernoun"
        "${geo}/share/skk/SKK-JISYO.geo"
      ];

      kanaTable = "azik";
      eggLikeNewline = true;
      markerHenkan = "▽ ";
      markerHenkanSelect = "▼ ";
      sources = [
        "skk_dictionary"
        "google_japanese_input"
      ];
    };
  };

  keymaps = [
    {
      action = "<Plug>(skkeleton-enable)";
      key = "<c-j>";
      mode = [
        "i"
        "c"
        "t"
      ];
    }
    {
      action = "i<Plug>(skkeleton-enable)";
      key = "<c-j>";
      mode = "n";
    }
    {
      action = "<Plug>(skkeleton-disable)";
      key = "<c-l>";
      mode = [
        "i"
        "c"
        "t"
      ];
    }
  ];
}
