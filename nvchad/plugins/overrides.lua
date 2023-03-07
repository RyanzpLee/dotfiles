local M = {}

M.treesitter = {
	ensure_installed = {
		"vim",
		"lua",
		"html",
		"css",
		"javascript",
		"c",
		"bash",
		"dockerfile",
		"typescript",
		"python",
		"yaml",
		"json",
		"json5",
	},
	autopairs = {
		enable = true,
	},
	rainbow = {
		enable = true,
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
	},
	autotag = {
		enable = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<M-w>", -- maps in normal mode to init the node/scope selection
			node_incremental = "<M-w>", -- increment to the upper named parent
			node_decremental = "<M-C-w>", -- decrement to the previous node
			scope_incremental = "<M-e>", -- increment to the upper scope (as defined in locals.scm)
		},
	},
	textsubjects = {
		enable = true,
		-- prev_selection = ",", -- (Optional) keymap to select the previous selection
		keymaps = {
			["."] = "textsubjects-smart",
			[";"] = "textsubjects-container-outer",
			["i;"] = "textsubjects-container-inner",
		},
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",

				["ac"] = "@conditional.outer",
				["ic"] = "@conditional.inner",

				["aa"] = "@parameter.outer",
				["ia"] = "@parameter.inner",

				["av"] = "@variable.outer",
				["iv"] = "@variable.inner",
			},
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				["]m"] = "@function.outer",
				["]]"] = "@class.outer",
			},
			goto_next_end = {
				["]M"] = "@function.outer",
				["]["] = "@class.outer",
			},
			goto_previous_start = {
				["[m"] = "@function.outer",
				["[["] = "@class.outer",
			},
			goto_previous_end = {
				["[M"] = "@function.outer",
				["[]"] = "@class.outer",
			},
		},
		swap = {
			enable = true,
			swap_next = {
				["<leader>sn"] = "@swappable",
				["<leader>nia"] = "@parameter.inner",
				["<Leader>naa"] = "@parameter.outer",
			},
			swap_previous = {
				["<leader>sp"] = "@swappable",
				["<leader>pia"] = "@parameter.inner",
				["<Leader>paa"] = "@parameter.outer",
			},
		},
	},
}

M.mason = {
	ensure_installed = {
		-- lua stuff
		"lua-language-server",
		"stylua",

		-- web dev stuff
		"css-lsp",
		"html-lsp",
		"typescript-language-server",
		"emmet-ls",
		"json-lsp",
		"css-lsp",
		"emmet-ls",
		"eslint-lsp",
		"html-lsp",
		"json-lsp",
		"lua-language-server",
		"prettier",
		"pyright",
		"shellcheck",
		"shfmt",
		"stylua",
		"typescript-language-server",
		"yaml-language-server",
	},
}

-- git support in nvimtree
M.nvimtree = {
	git = {
		enable = true,
	},

	renderer = {
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
		},
	},
}
-- requiring in here breaks the config
-- local lga_actions = require("telescope-live-grep-args.actions")
M.telescope = {
	defaults = {
		file_ignore_patterns = { "dist", "node_modules", ".git/", "yarn.lock" },
	},
	pickers = {
		lsp_references = {
			include_current_line = true,
			fname_width = 60,
			show_line = false,
		},
	},
	extensions = {
		live_grep_args = {
			auto_quoting = true, -- enable/disable auto-quoting
			mappings = { -- extend mappings
				i = {
					-- ["<C-k>"] = lga_actions.quote_prompt(),
					-- ["<C-u>"] = lga_actions.quote_prompt { postfix = " --iglob " },
				},
			},
		},
	},
	extensions_list = {
		"themes",
		"terms",
		"live_grep_args",
	},
}

return M
