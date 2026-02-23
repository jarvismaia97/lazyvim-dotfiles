-- LSP & Mason configuration
-- LazyVim handles most LSP setup via extras. This file adds custom servers.

return {
  -- Mason: auto-install LSP servers, formatters, linters
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- LSP servers
        "lua-language-server",
        "pyright",
        "typescript-language-server",
        "tailwindcss-language-server",
        "dockerfile-language-server",
        "docker-compose-language-service",
        "json-lsp",
        "yaml-language-server",
        "html-lsp",
        "css-lsp",
        "eslint-lsp",
        -- Formatters
        "prettier",
        "black",
        "isort",
        "stylua",
        "shfmt",
        -- Linters
        "ruff",
        "shellcheck",
      },
    },
  },

  -- LSP server configuration
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Lua
        lua_ls = {
          settings = {
            Lua = {
              workspace = { checkThirdParty = false },
              completion = { callSnippet = "Replace" },
              diagnostics = { globals = { "vim" } },
            },
          },
        },
        -- Python
        pyright = {
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "basic",
                autoImportCompletions = true,
              },
            },
          },
        },
        -- Docker
        dockerls = {},
        docker_compose_language_service = {},
        -- Tailwind
        tailwindcss = {},
      },
    },
  },

  -- Formatting (conform.nvim)
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        vue = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        sh = { "shfmt" },
      },
      format_on_save = {
        timeout_ms = 3000,
        lsp_fallback = true,
      },
    },
  },

  -- Linting (nvim-lint)
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        python = { "ruff" },
        sh = { "shellcheck" },
      },
    },
  },
}
