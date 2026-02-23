-- Editor enhancements

return {
  -- LazyGit integration
  {
    "kdheepak/lazygit.nvim",
    cmd = { "LazyGit", "LazyGitConfig", "LazyGitFilter" },
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },

  -- Todo comments (highlight TODO, FIXME, HACK, etc.)
  {
    "folke/todo-comments.nvim",
    opts = {},
  },

  -- Better diagnostics list
  {
    "folke/trouble.nvim",
    opts = {},
  },

  -- Git signs in gutter
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 500,
      },
    },
  },

  -- File explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,      -- Show hidden files (dimmed)
          hide_dotfiles = false,
          hide_gitignored = true,
          never_show = { ".DS_Store", "__pycache__", "node_modules" },
        },
      },
      window = {
        width = 35,
        mappings = {
          ["<space>"] = "none",  -- Don't conflict with leader
        },
      },
    },
  },

  -- Telescope enhancements
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = { preview_width = 0.55 },
          width = 0.87,
          height = 0.80,
        },
        file_ignore_patterns = {
          "node_modules", ".git/", "dist/", "build/",
          "__pycache__", "*.pyc", ".venv/",
        },
      },
    },
  },

  -- Which-key (already in LazyVim, just customize groups)
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>f", group = "find/files" },
        { "<leader>g", group = "git" },
        { "<leader>x", group = "diagnostics/trouble" },
        { "<leader>b", group = "buffers" },
        { "<leader>c", group = "code" },
        { "<leader>s", group = "search" },
      },
    },
  },
}
