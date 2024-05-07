return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      transparent_background = true,
      dim_inactive = {
        enabled = true,    -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
      },
      integrations = {
        mason = true,
        barbar = true,
        cmp = true,
        gitsigns = true,
        treesitter = true,
        notify = true,
        telescope = {
          enabled = true,
          style = "nvchad",
        },
      },
    })

    vim.cmd.colorscheme("catppuccin")
  end,
}
