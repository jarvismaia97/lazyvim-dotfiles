-- UI enhancements

return {
  -- Noice — better messages, cmdline, popupmenu
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        lsp_doc_border = true,
      },
    },
  },

  -- Dashboard — custom logo
  {
    "nvimdev/dashboard-nvim",
    opts = function(_, opts)
      local logo = [[
 ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗
 ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║
 ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║
 ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║
 ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║
 ╚══════╝╚═╝  ╚═╝╚══════╝  ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝
      ]]
      logo = string.rep("\n", 4) .. logo .. "\n\n"
      opts.config = opts.config or {}
      opts.config.header = vim.split(logo, "\n")
    end,
  },

  -- Lualine (statusline) — catppuccin auto-integrates
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = "catppuccin",
        component_separators = { left = "│", right = "│" },
        section_separators = { left = "", right = "" },
      },
    },
  },

  -- Indent guides
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      indent = { char = "│", tab_char = "│" },
      scope = { enabled = true, show_start = false },
    },
  },
}
