{
  pkgs,
  lib,
  ...
}:
{
  extraPlugins = with pkgs.vimPlugins; [
    skkeleton
  ];

  extraConfigVim =
    let
      azik_kanatable = import ./azik_kanatable.nix { inherit lib; };
    in
    # vim
    ''
      ${azik_kanatable}

      call skkeleton#config({
      \ 'globalDictionaries': [
      \   ['~/.skk/SKK-JISYO.L', 'euc-jp'],
      \   '~/.skk/SKK-JISYO.jinmei',
      \   '~/.skk/SKK-JISYO.fullname',
      \   '~/.skk/SKK-JISYO.propernoun',
      \   '~/.skk/SKK-JISYO.geo',
      \   '~/.skk/SKK-JISYO.station'],
      \ 'eggLikeNewline': v:true,
      \ 'kanaTable': 'azik',
      \ 'markerHenkan': '▽ ',
      \ 'markerHenkanSelect': '▼ ',
      \ 'sources': [
      \   'skk_dictionary',
      \   'google_japanese_input',
      \ ],
      \ })
    '';

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
