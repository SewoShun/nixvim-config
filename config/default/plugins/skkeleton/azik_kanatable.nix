{ lib, ... }:
let
  vowel_rom = [
    "a"
    "i"
    "u"
    "e"
    "o"
  ];
  vowel_hatuon = [
    "z"
    "k"
    "j"
    "d"
    "l"
  ];
  double_vowel = [
    {
      rom = "q";
      kana = "い";
    }
    {
      rom = "h";
      kana = "う";
    }
    {
      rom = "w";
      kana = "い";
    }
    {
      rom = "p";
      kana = "う";
    }
  ];
  vowel_map = {
    a = [ "あ" ];
    i = [ "い" ];
    u = [ "う" ];
    e = [ "え" ];
    o = [ "お" ];
  };

  mapping_table = rec {
    k = [
      "か"
      "き"
      "く"
      "け"
      "こ"
    ];
    s = [
      "さ"
      "し"
      "す"
      "せ"
      "そ"
    ];
    t = [
      "た"
      "ち"
      "つ"
      "て"
      "と"
    ];
    n = [
      "な"
      "に"
      "ぬ"
      "ね"
      "の"
    ];
    h = [
      "は"
      "ひ"
      "ふ"
      "へ"
      "ほ"
    ];
    m = [
      "ま"
      "み"
      "む"
      "め"
      "も"
    ];
    y = [
      "や"
      "い"
      "ゆ"
      "いぇ"
      "よ"
    ];
    r = [
      "ら"
      "り"
      "る"
      "れ"
      "ろ"
    ];
    w = [
      "わ"
      "うぃ"
      "う"
      "うぇ"
      "を"
    ];

    g = [
      "が"
      "ぎ"
      "ぐ"
      "げ"
      "ご"
    ];
    z = [
      "ざ"
      "じ"
      "ず"
      "ぜ"
      "ぞ"
    ];
    d = [
      "だ"
      "ぢ"
      "づ"
      "で"
      "ど"
    ];
    b = [
      "ば"
      "び"
      "ぶ"
      "べ"
      "ぼ"
    ];
    p = [
      "ぱ"
      "ぴ"
      "ぷ"
      "ぺ"
      "ぽ"
    ];

    ky = [
      "きゃ"
      "き"
      "きゅ"
      "きぇ"
      "きょ"
    ];
    sy = [
      "しゃ"
      "し"
      "しゅ"
      "しぇ"
      "しょ"
    ];
    c = [
      "ちゃ"
      "ち"
      "ちゅ"
      "ちぇ"
      "ちょ"
    ];
    ty = [
      "てゃ"
      "てぃ"
      "てゅ"
      "てぇ"
      "てょ"
    ];
    ny = [
      "にゃ"
      "に"
      "にゅ"
      "にぇ"
      "にょ"
    ];
    hy = [
      "ひゃ"
      "ひ"
      "ひゅ"
      "ひぇ"
      "ひょ"
    ];
    my = [
      "みゃ"
      "み"
      "みゅ"
      "みぇ"
      "みょ"
    ];
    ry = [
      "りゃ"
      "り"
      "りゅ"
      "りぇ"
      "りょ"
    ];

    gy = [
      "ぎゃ"
      "ぎ"
      "ぎゅ"
      "ぎぇ"
      "ぎょ"
    ];
    zy = [
      "じゃ"
      "じ"
      "じゅ"
      "じぇ"
      "じょ"
    ];
    dy = [
      "ぢゃ"
      "ぢ"
      "ぢゅ"
      "ぢぇ"
      "ぢょ"
    ];
    by = [
      "びゃ"
      "び"
      "びゅ"
      "びぇ"
      "びょ"
    ];
    py = [
      "ぴゃ"
      "ぴ"
      "ぴゅ"
      "ぴぇ"
      "ぴょ"
    ];

    tg = [
      "た"
      "てぃ"
      "とぅ"
      "て"
      "と"
    ];
    dc = [
      "だ"
      "でぃ"
      "どぅ"
      "で"
      "ど"
    ];
    f = [
      "ふぁ"
      "ふぃ"
      "ふ"
      "ふぇ"
      "ふぉ"
    ];
    v = [
      "ゔぁ"
      "ゔぃ"
      "ゔ"
      "ゔぇ"
      "ゔぉ"
    ];
    ws = [
      "うぁ"
      "うぃ"
      "うぅ"
      "うぇ"
      "うぉ"
    ];
    l = [
      "ぁ"
      "ぃ"
      "ぅ"
      "ぇ"
      "ぉ"
    ];
    ly = [
      "ゃ"
      "ぃ"
      "ゅ"
      "ぇ"
      "ょ"
    ];

    kg = ky;
    x = sy;
    ng = ny;
    hg = hy;
    mg = my;
    j = zy;
    pg = py;
  };

  other_map = {
    q = [ "ん" ];
    ";" = [ "っ" ];

    "[" = [ "「" ];
    "]" = [ "」" ];
    "," = [ "、" ];
    "." = [ "。" ];
    "-" = [ "ー" ];

    "x[" = [ "[" ];
    "x]" = [ "]" ];
    "x," = [ "," ];
    "x." = [ "." ];
    "x-" = [ "-" ];

    "kt" = [ "こと" ];
    "st" = [ "した" ];
    "tt" = [ "たち" ];
    "ht" = [ "ひと" ];

    "wt" = [ "わた" ];
    "mn" = [ "もの" ];
    "ms" = [ "ます" ];
    "ds" = [ "です" ];

    "km" = [ "かも" ];
    "tm" = [ "ため" ];
    "dm" = [ "でも" ];
    "kr" = [ "から" ];

    "sr" = [ "する" ];
    "tr" = [ "たら" ];
    "nr" = [ "なる" ];
    "yr" = [ "よる" ];

    "rr" = [ "られ" ];
    "zr" = [ "ざる" ];
    "mt" = [ "また" ];
    "tb" = [ "たび" ];

    "nb" = [ "ねば" ];
    "bt" = [ "びと" ];
    "gr" = [ "がら" ];
    "gt" = [ "ごと" ];

    "nt" = [ "にち" ];
    "dt" = [ "だち" ];
    "wr" = [ "われ" ];

    xxh = [ "←" ];
    xxj = [ "↓" ];
    xxk = [ "↑" ];
    xxl = [ "→" ];

    " " = "henkanFirst";
    "\\" = "katakana";
  };

  base_map = builtins.listToAttrs (
    lib.lists.flatten (
      lib.attrsets.mapAttrsToList (
        name: value:
        (lib.lists.zipListsWith (v: k: {
          name = "${name}${v}";
          value = [ k ];
        }) vowel_rom value)
      ) mapping_table
    )
  );
  hatuon_map = builtins.listToAttrs (
    lib.lists.flatten (
      lib.attrsets.mapAttrsToList (
        name: value:
        (lib.lists.zipListsWith (v: k: {
          name = "${name}${v}";
          value = [ "${k}ん" ];
        }) vowel_hatuon value)
      ) mapping_table
    )
  );
  double_vowel_map = builtins.listToAttrs (
    lib.lists.flatten (
      lib.attrsets.mapAttrsToList (
        name: value:
        (lib.lists.zipListsWith (v: k: {
          name = "${name}${v.rom}";
          value = [ "${k}${v.kana}" ];
        }) double_vowel (lib.lists.remove (builtins.elemAt value 1) value))
      ) mapping_table
    )
  );

  complete_map = vowel_map // base_map // hatuon_map // double_vowel_map // other_map;

in
{
  plugins.skkeleton.kanatables.azik = {
    create = true;
    table = complete_map;
  };
}
