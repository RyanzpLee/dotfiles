---@type MappingsConfig
local M = {}

M.general = {
	n = {
		["<A-j>"] = { ":m .+1<CR>==", "move current line down one line" },
		["<A-k>"] = { ":m .-2<CR>==", "move current line up one line" },
		-- Quick fix bindings
		["<leader>q"] = { "<cmd>lua require'custom.utils'.toggle_qf('q')<CR>", "Open/close quick fix list" },
		["[q"] = { ":cprevious<CR>", "Next quickfix" },
		["]q"] = { ":cnext<CR>", "Previous quickfix" },
	},
	i = {
		["<C-c>"] = { "<Esc>", "Control-c doesn't trigger InsertLeave event" },
		["<A-j>"] = { "<Esc>:m .+1<CR>==gi", "move current line down one line" },
		["<A-k>"] = { "<Esc>:m .-2<CR>==gi", "move current line up one line" },
	},
	v = {
		["<A-j>"] = { ":m '>+1<CR>gv-gv", "move current line down one line" },
		["<A-k>"] = { ":m '<-2<CR>gv-gv", "move current line up one line" },
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

M.telescope = {
	n = {
		["<leader>pw"] = {
			function()
				require("telescope").extensions.live_grep_args.live_grep_args()
			end,
		},
		["<leader>gs"] = { "<cmd> Telescope git_status <CR>", "git status" },
		["<leader>gr"] = { "<cmd> Telescope lsp_references <CR>", "lsp references" },
	},
}

M.lspconfig = {
	n = {
		["]d"] = {
			function()
				vim.diagnostic.goto_next()
			end,
			"goto_next",
		},
	},
}

return M
