-- Tech stack specific plugins: TypeScript, Prisma, Bun, pnpm, Koa, Elysia, Zod

return {
  -- Prisma syntax highlighting & LSP
  {
    "pantharshit00/vim-prisma",
    ft = "prisma",
  },

  -- Package.json: show latest versions, update inline
  -- <leader>cp = show versions, <leader>cu = update package
  {
    "vuki656/package-info.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    ft = "json",
    config = function()
      local pi = require("package-info")
      pi.setup({
        colors = {
          up_to_date = "#3C4048",
          outdated = "#f7768e",
        },
        hide_up_to_date = true,
        package_manager = "pnpm",
      })
      vim.keymap.set("n", "<leader>cp", pi.show, { desc = "Show package versions" })
      vim.keymap.set("n", "<leader>cu", pi.update, { desc = "Update package" })
      vim.keymap.set("n", "<leader>ci", pi.install, { desc = "Install package" })
      vim.keymap.set("n", "<leader>cd", pi.delete, { desc = "Delete package" })
      vim.keymap.set("n", "<leader>cv", pi.change_version, { desc = "Change version" })
    end,
  },

  -- Database client (PostgreSQL, SQLite, MySQL)
  -- <leader>db = toggle DB UI
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
    cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
    keys = {
      { "<leader>db", "<cmd>DBUIToggle<cr>", desc = "Toggle DB UI" },
    },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },

  -- REST client (test APIs inline, like Postman)
  -- <leader>rr = run request, <leader>rl = run last
  {
    "rest-nvim/rest.nvim",
    ft = "http",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>rr", "<cmd>Rest run<cr>", desc = "Run HTTP request" },
      { "<leader>rl", "<cmd>Rest run last<cr>", desc = "Re-run last request" },
      { "<leader>rp", "<cmd>Rest run cursor<cr>", desc = "Preview request" },
    },
    config = function()
      require("rest-nvim").setup({
        result_split_horizontal = false,
        skip_ssl_verification = true,
      })
    end,
  },

  -- Tailwind CSS tools: color preview, class sorting
  {
    "luckasRanaworthe/tailwind-tools.nvim",
    name = "tailwind-tools",
    build = ":UpdateRemotePlugins",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    ft = { "html", "typescriptreact", "javascriptreact", "svelte", "vue", "tsx", "jsx" },
    opts = {},
  },
}
