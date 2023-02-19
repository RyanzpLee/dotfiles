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
		"yaml", "json",
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
		-- "deno",
		--
		-- "bash-language-server",
		-- "css-lsp",
		-- "diagnostic-languageserver",
		-- "docker-compose-language-service",
		-- "dockerfile-language-server",
		-- "eslint",
		-- "jq",
		-- "js-debug-adapter",
		-- "json-lsp",
		-- "markdownlint",
		-- "prettier",
		-- "pylint",
		-- "pyright",
		-- "rustfmt",
		-- "stylua",
		-- "typescript-language-server",
		-- "yaml-language-server",
		-- "yamlfmt",
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

M.telescope = {
	extensions = {
		live_grep_args = {
			auto_quoting = true, -- enable/disable auto-quoting
			mappings = { -- extend mappings
				i = {
				  ["<C-k>"] = require("telescope-live-grep-args.actions").quote_prompt(),
				  ["<C-u>"] = require("telescope-live-grep-args.actions").quote_prompt { postfix = " --iglob " },
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
