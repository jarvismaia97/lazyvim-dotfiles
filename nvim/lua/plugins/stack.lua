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
  -- Create .http files and run requests
  -- <leader>rr = run request, <leader>rl = run last
  {
    "mistweaverco/kulala.nvim",
    ft = "http",
    keys = {
      { "<leader>rr", function() require("kulala").run() end, desc = "Run HTTP request" },
      { "<leader>rl", function() require("kulala").replay() end, desc = "Replay last request" },
      { "<leader>ri", function() require("kulala").inspect() end, desc = "Inspect request" },
    },
    opts = {},
  },

  -- Tailwind CSS tools: color preview, class sorting
  {
    "luckasRanaworthe/tailwind-tools.nvim",
    name = "tailwind-tools",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    ft = { "html", "typescriptreact", "javascriptreact", "svelte", "vue" },
    opts = {},
    enabled = false, -- Enable when repo is available
  },
}
