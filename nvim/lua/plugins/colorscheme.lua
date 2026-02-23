-- Catppuccin Mocha theme
-- https://github.com/catppuccin/nvim

return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha",
      transparent_background = false,
      term_colors = true,
      integrations = {
        cmp = true,
        gitsigns = true,
        harpoon = true,
        indent_blankline = { enabled = true },
        mason = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        neotree = true,
        noice = true,
        notify = true,
        telescope = { enabled = true },
        treesitter = true,
        trouble = true,
        which_key = true,
      },
    },
  },

  -- Set as default colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
