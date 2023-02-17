---@type MappingsConfig
local M = {}

M.general = {
  n = {
    ["<A-j>"] = { ":m .+1<CR>==", "move current line up one line" },
    ["<A-k>"] = { ":m .-2<CR>==", "move current line up one line" },
  },
}

M.tmux_navigator = {
  n = {
    ["<C-h>"] = {
      function()
        require("nvim-tmux-navigation").NvimTmuxNavigateLeft()
      end,
    },

    ["<C-j>"] = {
      function()
        require("nvim-tmux-navigation").NvimTmuxNavigateDown()
      end,
    },

    ["<C-k>"] = {
      function()
        require("nvim-tmux-navigation").NvimTmuxNavigateUp()
      end,
    },

    ["<C-l>"] = {
      function()
        require("nvim-tmux-navigation").NvimTmuxNavigateRight()
      end,
    },
  },
}
-- more keybinds!

return M
-- Move text up and down
-- keymap("n", "<A-j>", ":m .+1<CR>==")
-- keymap("n", "<A-k>", ":m .-2<CR>==")
-- keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
-- keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
-- keymap("x", "<A-j>", ":m '>+1<CR>gv-gv")
-- keymap("x", "<A-k>", ":m '<-2<CR>gv-gv")
