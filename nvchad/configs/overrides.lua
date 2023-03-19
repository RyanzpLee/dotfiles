local M = {}

M.treesitter = {
	ensure_installed = {
		"vim",
		"lua",
		"html",
		"css",
		"javascript",
		"c",
		"markdown",
		"markdown_inline",
		"bash",
		"dockerfile",
		"typescript",
		"python",
		"yaml",
		"json",
		"jsonc",
		"json5",
		"rst",
	},
	indent = {
		enable = true,
		disable = {
			"python",
		},
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
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
				["]aa"] = "@swappable",
				["]m"] = "@function.outer",
				["]]"] = "@class.outer",
			},
			goto_next_end = {
				["]ia"] = "@swappable",
				["]M"] = "@function.outer",
				["]["] = "@class.outer",
			},
			goto_previous_start = {
				["[aa"] = "@swappable",
				["[m"] = "@function.outer",
				["[["] = "@class.outer",
			},
			goto_previous_end = {
				["[ia"] = "@swappable",
				["[M"] = "@function.outer",
				["[]"] = "@class.outer",
			},
			goto_next = {
				["]p"] = "@swappable",
			},
			goto_previous = {
				["[p"] = "@swappable",
			},
		},
		swap = {
			enable = true,
			swap_next = {
				["<leader>sn"] = "@swappable",
			},
			swap_previous = {
				["<leader>sp"] = "@swappable",
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
		"deno",
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

return M
