{
  plugins.lspsaga.enable = true;

  keymaps = [
    {
      action = "<cmd>Lspsaga code_action<cr>";
      key = "<leader>a";
      mode = "n";
    }
    {
      action = "<cmd>Lspsaga goto_definition<cr>";
      key = "gd";
      mode = "n";
    }
    {
      action = "<cmd>Lspsaga goto_type_definition<cr>";
      key = "gy";
      mode = "n";
    }
    {
      action = "<cmd>Lspsaga peak_definition<cr>";
      key = "gD";
      mode = "n";
    }
    {
      action = "<cmd>Lspsaga peak_type_definition<cr>";
      key = "gY";
      mode = "n";
    }
    {
      action = "<cmd>Lspsaga hover_doc<cr>";
      key = "K";
      mode = "n";
    }
    {
      action = "<cmd>Lspsaga diagnostic_jump_prev<cr>";
      key = "[d";
      mode = "n";
    }
    {
      action = "<cmd>Lspsaga diagnostic_jump_next<cr>";
      key = "]d";
      mode = "n";
    }
    {
      action = "<cmd>Lspsaga finder<cr>";
      key = "<leader>fr";
      mode = "n";
    }
    {
      action = "<cmd>Lspsaga term_toggle<cr>";
      key = "<c-t>";
      mode = [
        "n"
        "t"
      ];
    }
    {
      action = "<cmd>Lspsaga outline<cr>";
      key = "<leader>O";
      mode = "n";
    }
    {
      action = "<cmd>Lspsaga rename<cr>";
      key = "<leader>r";
      mode = "n";
    }
  ];
}
