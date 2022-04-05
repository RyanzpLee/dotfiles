local keymap = require("lib.utils").keymap

vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<leader>ve", ":edit $MYVIMRC<CR>")
keymap("n", "<leader>vs", ":source ~/.config/nvim/init.lua<CR>")
-- Bufferline
keymap("n", "<leader>bp", ":BufferLinePick<CR>")
-- Quick fix list
keymap("n", "<C-q>", "<cmd>lua require'lib.utils'.toggle_qf('q')<CR>")
keymap("n", "<leader>Q", "<cmd>lua require'lib.utils'.toggle_qf('l')<CR>")

-- Turn off incremental search highlighting
keymap("n", "<leader><CR>", ":nohlsearch<CR>")

-- Allow gf to open non-existent files
keymap("", "gf", ":edit <cfile><CR>")

-- Reselect visual selection after indenting
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Maintain the cursor position when yanking a visual selection
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
keymap("v", "y", "myy`hay")
keymap("v", "Y", "myY`y")

-- When text is wrapped, move by terminal rows, not lines, unless a count is provided
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Resize with arrows
keymap("n", "<A-Up>", ":resize +2<CR>")
keymap("n", "<A-Down>", ":resize -2<CR>")
keymap("n", "<A-Left>", ":vertical resize -2<CR>")
keymap("n", "<A-Right>", ":vertical resize +2<CR>")

-- Move text up and down
keymap("n", "<A-j>", ":m .+1<CR>==")
keymap("n", "<A-k>", ":m .-2<CR>==")
keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
keymap("x", "<A-j>", ":m '>+1<CR>gv-gv")
keymap("x", "<A-k>", ":m '<-2<CR>gv-gv")
