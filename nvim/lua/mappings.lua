require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>gr", "<cmd> Telescope lsp_references <CR>", { desc = "Telescope search for references" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("n", "<A-j>", ":m .+1<CR>==", { desc = "Move current line down one line" })
map("n", "<A-k>", ":m .-2<CR>==", { desc = "Move current line up one line" })
map("n", "<leader>d", '"_d', { desc = "Delete without yank" })

map("v", "<A-j>", ":m '>+1<CR>gv-gv", { desc = "move current line down one line" })
map("v", "<A-k>", ":m '<-2<CR>gv-gv", { desc = "move current line up one line" })
map("v", "<leader>d", '"_d', { desc = "Delete without yank" })

-- M.general = {
--   n = {
--     ["<A-j>"] = { ":m .+1<CR>==", "move current line down one line" },
--     ["<A-k>"] = { ":m .-2<CR>==", "move current line up one line" },
--     -- Quick fix bindings
--     ["<leader>q"] = { "<cmd>lua require'custom.utils'.toggle_qf('q')<CR>", "Open/close quick fix list" },
--     ["[q"] = { ":cprevious<CR>", "Next quickfix" },
--     ["]q"] = { ":cnext<CR>", "Previous quickfix" },
--     ["<leader>d"] = { '"_d', "delete without yank" },
--     ["<leader>tsp"] = { ":TSPlaygroundToggle<CR>" },
--   },
--   i = {
--     ["<C-c>"] = { "<Esc>", "Control-c doesn't trigger InsertLeave event" },
--     ["<A-j>"] = { "<Esc>:m .+1<CR>==gi", "move current line down one line" },
--     ["<A-k>"] = { "<Esc>:m .-2<CR>==gi", "move current line up one line" },
--   },
--   v = {
--     ["<A-j>"] = { ":m '>+1<CR>gv-gv", "move current line down one line" },
--     ["<A-k>"] = { ":m '<-2<CR>gv-gv", "move current line up one line" },
--     ["<leader>d"] = { '"_d', "delete without yank" },
--   },
-- }
