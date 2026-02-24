-- Keymaps
-- https://www.lazyvim.org/configuration/keymaps
-- Note: Many of these are already set by LazyVim defaults.
-- We define them explicitly for clarity and customization.

local map = vim.keymap.set

-- ── 60% Keyboard Optimizations (NuPhy Air60 V2) ────────────
-- Exit insert mode without reaching for Escape
map("i", "jk", "<Esc>", { desc = "Exit insert mode" })
map("i", "jj", "<Esc>", { desc = "Exit insert mode" })

-- ; as : (skip Shift for command mode — huge on 60%)
map("n", ";", ":", { desc = "Command mode" })
map("v", ";", ":", { desc = "Command mode" })

-- Quick save/quit with leader
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file" })
map("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })
map("n", "<leader>Q", "<cmd>qa!<cr>", { desc = "Quit all (force)" })

-- ── Navigation ──────────────────────────────────────────────
-- Better window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Resize windows with arrows
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- ── Buffers ─────────────────────────────────────────────────
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Delete buffer" })

-- ── Editing ─────────────────────────────────────────────────
-- Move lines up/down in visual mode
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- Keep cursor centered when scrolling
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down (centered)" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up (centered)" })

-- Keep cursor centered when searching
map("n", "n", "nzzzv", { desc = "Next search result (centered)" })
map("n", "N", "Nzzzv", { desc = "Prev search result (centered)" })

-- Better paste (don't yank replaced text)
map("x", "<leader>p", [["_dP]], { desc = "Paste without yank" })

-- Delete to void register
map({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete to void" })

-- Quick save
map({ "n", "i", "v", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- Clear search highlights
map("n", "<Esc>", "<cmd>noh<cr><esc>", { desc = "Clear highlights" })

-- ── Telescope ───────────────────────────────────────────────
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help tags" })
map("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Recent files" })
map("n", "<leader>fc", "<cmd>Telescope git_commits<cr>", { desc = "Git commits" })
map("n", "<leader>fs", "<cmd>Telescope git_status<cr>", { desc = "Git status" })
map("n", "<leader>fw", "<cmd>Telescope grep_string<cr>", { desc = "Grep word under cursor" })

-- ── File Explorer ───────────────────────────────────────────
map("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle file explorer" })

-- ── Harpoon ─────────────────────────────────────────────────
-- (configured in plugins/harpoon.lua)

-- ── Trouble ─────────────────────────────────────────────────
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
map("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer diagnostics" })
map("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { desc = "Location list" })
map("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix list" })

-- ── LazyGit ─────────────────────────────────────────────────
map("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })

-- ── LSP (set in on_attach, but defined here for reference) ──
-- gd = go to definition       (set by LazyVim)
-- gr = references              (set by LazyVim)
-- K  = hover docs              (set by LazyVim)
-- <leader>ca = code action     (set by LazyVim)
-- <leader>cr = rename          (set by LazyVim)

-- ── New Plugin Keymaps (reference) ──────────────────────────
-- <leader>z   = Zen Mode toggle
-- <leader>sr  = Spectre (search & replace project-wide)
-- <leader>sw  = Spectre (word under cursor)
-- <leader>re  = Extract function (visual)
-- <leader>rv  = Extract variable (visual)
-- <leader>ri  = Inline variable
-- <leader>tt  = Run nearest test
-- <leader>tf  = Run file tests
-- <leader>ts  = Test summary
-- <leader>o   = Oil file manager
-- -           = Oil (parent dir)
-- sa/sd/sr    = Surround add/delete/replace
