{
  plugins.barbar.enable = true;

  keymaps = [
    {
      key = "[b";
      action = "<cmd>BufferPrevious<cr>";
    }
    {
      key = "]b";
      action = "<cmd>BufferNext<cr>";
    }
  ];
}
