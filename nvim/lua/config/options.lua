-- Options
-- https://www.lazyvim.org/configuration/general

local opt = vim.opt

-- General
opt.autowrite = true
opt.clipboard = "unnamedplus"       -- System clipboard
opt.confirm = true
opt.mouse = "a"
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200
opt.timeoutlen = 300                -- which-key popup speed

-- UI
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.termguicolors = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.pumheight = 10                  -- Completion menu height
opt.showmode = false                -- Handled by lualine
opt.laststatus = 3                  -- Global statusline
opt.splitbelow = true
opt.splitright = true
opt.splitkeep = "screen"

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Indentation
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true
opt.shiftround = true

-- Wrapping
opt.wrap = false
opt.breakindent = true
opt.linebreak = true

-- Folding (treesitter-based)
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldlevel = 99
opt.foldlevelstart = 99

-- Completion
opt.completeopt = "menu,menuone,noselect"

-- Grep (use ripgrep if available)
if vim.fn.executable("rg") == 1 then
  opt.grepprg = "rg --vimgrep --smart-case"
  opt.grepformat = "%f:%l:%c:%m"
end

-- Leader key (space)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
