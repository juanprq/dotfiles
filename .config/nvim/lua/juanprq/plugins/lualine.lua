return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      icons_enabled = true,
      theme = "catppuccin",
    },
    sections = {
      lualine_a = {
        {
          "filename",
          path = 1,
        },
      },
    },
  },
}
