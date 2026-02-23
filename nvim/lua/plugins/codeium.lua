-- Codeium — free AI code completion (Copilot alternative)
-- https://github.com/Exafunction/codeium.nvim
--
-- Setup: after first launch, run :Codeium Auth to authenticate

return {
  {
    "Exafunction/codeium.nvim",
    event = "InsertEnter",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("codeium").setup({
        enable_cmp_source = true,
        virtual_text = {
          enabled = true,
          manual = false,
          idle_delay = 75,
          key_bindings = {
            accept = "<Tab>",
            accept_word = "<C-Right>",
            accept_line = "<C-End>",
            next = "<M-]>",
            prev = "<M-[>",
            clear = "<C-]>",
          },
        },
      })
    end,
  },

  -- Add Codeium as completion source
  {
    "hrsh7th/nvim-cmp",
    optional = true,
    dependencies = { "Exafunction/codeium.nvim" },
    opts = function(_, opts)
      table.insert(opts.sources, 1, {
        name = "codeium",
        group_index = 1,
        priority = 100,
      })
    end,
  },
}
