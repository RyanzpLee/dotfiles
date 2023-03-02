---@type MappingsConfig
local M = {}

M.disabled = {
	n = {
		["<leader>ls"] = "",
	},
}

M.general = {
	n = {
		["<A-j>"] = { ":m .+1<CR>==", "move current line down one line" },
		["<A-k>"] = { ":m .-2<CR>==", "move current line up one line" },
		-- Quick fix bindings
		["<leader>q"] = { "<cmd>lua require'custom.utils'.toggle_qf('q')<CR>", "Open/close quick fix list" },
		["[q"] = { ":cprevious<CR>", "Next quickfix" },
		["]q"] = { ":cnext<CR>", "Previous quickfix" },
		-- ["<CR>"] = { ":TSPlaygroundToggle<CR>" },
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
		["<leader>pg"] = {
			function()
				require("telescope").extensions.live_grep_args.live_grep_args()
			end,
		},
		["<leader>pd"] = {
			function()
				require("telescope").extensions.live_grep_args.live_grep_args({ cwd = vim.fn.expand("%:p:h") })
			end,
		},
		["<leader>gs"] = { "<cmd> Telescope git_status <CR>", "git status" },
		["<leader>gr"] = { "<cmd> Telescope lsp_references <CR>", "lsp references" },
		["<leader>fr"] = { "<cmd> Telescope resume <CR>", "resume last picker" },
		["<leader>pw"] = {
			"<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.expand('<cword>')})<CR>",
			"grep word under cursor",
		},
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
		["<leader>sh"] = {
			function()
				vim.lsp.buf.signature_help()
			end,
			"lsp signature_help",
		},
	},
}

M.minisessions = {
	n = {
		["<leader>msw"] = { ":lua MiniSessions.write(vim.fn.input('Session Name>'))<CR>" },
		["<leader>msd"] = { " :lua =MiniSessions.detected<CR>" },
	},
}

M.harpoon = {
	n = {
		["<leader>a"] = { ":lua require('harpoon.mark').add_file()<CR>" },
		["<C-e>"] = { ":lua require('harpoon.ui').toggle_quick_menu()<CR>" },
		["<leader>j"] = { ":lua require('harpoon.ui').nav_file(1)<CR>" },
		["<leader>k"] = { ":lua require('harpoon.ui').nav_file(2)<CR>" },
		["<leader>l"] = { ":lua require('harpoon.ui').nav_file(3)<CR>" },
		["<leader>;"] = { ":lua require('harpoon.ui').nav_file(4)<CR>" },
	},
}

return M
