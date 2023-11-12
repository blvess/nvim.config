return {
  "akinsho/toggleterm.nvim",
  version = "*",
  lazy = false,
  keys = {
    { "t", "<esc>", [[<C-\><C-n>]], desc = "ToggleTerm" },
  },
  opts = {
    open_mapping = [[<C-\>]],
    direction = "float",
    float_opts = {},
  },
}
