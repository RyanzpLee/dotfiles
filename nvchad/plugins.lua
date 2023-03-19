local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- format & linting
			{
				"jose-elias-alvarez/null-ls.nvim",
				config = function()
					require("custom.configs.null-ls")
				end,
			},
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end, -- Override to setup mason-lspconfig
	},

	-- override plugin configs
	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			{
				"nvim-treesitter/nvim-treesitter-textobjects",
			},
			{
				"RRethy/nvim-treesitter-textsubjects",
			},
			{
				"JoosepAlviste/nvim-ts-context-commentstring",
			},
		},
		opts = overrides.treesitter,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},

	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			-- grep with ripgrep allows args
			{
				"nvim-telescope/telescope-live-grep-args.nvim",
			},
		},
		opts = function()
			local lga_actions = require("telescope-live-grep-args.actions")

			return {
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
								["<C-k>"] = lga_actions.quote_prompt(),
								["<C-u>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
								["<C-s>"] = lga_actions.quote_prompt({ postfix = " --iglob !*spec*" }),
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
		end,
	},

	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
	},

	{
		"p00f/nvim-ts-rainbow",
	},

	{
		"echasnovski/mini.align",
		config = function()
			require("mini.align").setup()
		end,
	},

	{
		"ThePrimeagen/harpoon",
	},

	{
		"numToStr/Comment.nvim",
		keys = { "gc", "gb" },
		opts = function()
			return {
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			}
		end,
	},
}

return plugins
