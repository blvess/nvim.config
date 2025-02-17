return {
  'stevearc/oil.nvim',
  opts = {
    skip_confirm_for_simple_edits = false,
    keymaps = {
      ["<C-p>"] = false,
      ["<C-l>"] = false,
      ["<C-h>"] = false,
      ["<C-S-s>"] = { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split" },
      ["gd"] = {
        desc = "Toggle file detail view",
        callback = function()
          Detail = not Detail
          if Detail then
            require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
          else
            require("oil").set_columns({ "icon" })
          end
        end,
      },
    },
  },
  keys = {
    { "-", "<CMD>Oil<CR>", desc = "Open parent directory" },
  },
  lazy = false,
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
