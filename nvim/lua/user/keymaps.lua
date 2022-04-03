local keymap = require("lib.utils").keymap

local M = {}

local opts = { noremap = true, silent = false }
local mode_adapters = {
    insert_mode = "i",
    normal_mode = "n",
    term_mode = "t",
    visual_mode = "v",
    visual_block_mode = "x",
    command_mode = "c"
}


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
keymap("n", "<leader>k", ":nohlsearch<CR>")

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

-- Easy insertion of a trailing ; or , from insert mode
keymap("i", ";;", "<Esc>A;<Esc>")
keymap("i", ",,", "<Esc>A,<Esc>")

-- Open the current file in the default program (on Mac I think this is just `open`)
keymap("n", "<leader>x", ":!open %<cr><cr>")

-- Disable annoying command line thing
keymap("n", "q:", ":q<CR>")

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>")
keymap("n", "<C-Down>", ":resize -2<CR>")
keymap("n", "<C-Left>", ":vertical resize -2<CR>")
keymap("n", "<C-Right>", ":vertical resize +2<CR>")

-- Move text up and down
keymap("n", "<A-j>", ":m .+1<CR>==")
keymap("n", "<A-k>", ":m .-2<CR>==")
keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
keymap("x", "<A-j>", ":m '>+1<CR>gv-gv")
keymap("x", "<A-k>", ":m '<-2<CR>gv-gv")


local lsp_keymappings = {

    normal_mode = {
        ["K"] = "<Cmd>lua vim.lsp.buf.hover()<CR>",
        ["gD"] = "<Cmd>lua vim.lsp.buf.declaration()<CR>",
        ["gd"] = "<Cmd>lua vim.lsp.buf.definition()<CR>",
        ["gi"] = "<Cmd>lua vim.lsp.buf.implementation()<CR>",
        ["<leader>rn"] = "<Cmd>lua vim.lsp.buf.rename()<CR>",
        ["<C-k>"] = "<Cmd>lua vim.lsp.buf.signature_help()<CR>",
        ["<leader>d"] = "<Cmd>lua vim.diagnostic.open_float()<CR>",
        ["[d"] = "<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>",
        ["]d"] = "<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
        ["gr"] = ":Telescope lsp_references<CR>",
        ["<leader>ca"] = ":CodeActionMenu<CR>"
    },
    visual_mode = {
        ["<leader>ca"] = ":CodeActionMenu<CR>"
    }
}

function M.map(mode, keymaps)
  mode = mode_adapters[mode] and mode_adapters[mode] or mode
  for k, v in pairs(keymaps) do
    M.set_keymaps(mode, k, v)
  end
end

function M.setup_lsp_mappings()
  for mode, mapping in pairs(lsp_keymappings) do
    M.map(mode, mapping)
  end
end