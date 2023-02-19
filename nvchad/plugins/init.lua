local overrides = require("custom.plugins.overrides")

---@type {[PluginName]: NvPluginConfig|false}
local plugins = {

	-- ["goolord/alpha-nvim"] = { disable = false },  -- enables dashboard
	-- ["folke/which-key.nvim"] = { disable = false }, -- enables whichKey

	-- Override plugin definition options
	["neovim/nvim-lspconfig"] = {
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.plugins.lspconfig")
		end,
	},

	-- overrde plugin configs
	["nvim-treesitter/nvim-treesitter"] = {
		override_options = overrides.treesitter,
	},

	["williamboman/mason.nvim"] = {
		override_options = overrides.mason,
	},

	["nvim-tree/nvim-tree.lua"] = {
		override_options = overrides.nvimtree,
	},

	["nvim-telescope/telescope-live-grep-args.nvim"] = {},

	["nvim-telescope/telescope.nvim"] = {
		module = "telescope",
		override_options = overrides.telescope,
	},

	-- Install a plugin
	-- ["max397574/better-escape.nvim"] = {
	--   event = "InsertEnter",
	--   config = function()
	--     require("better_escape").setup()
	--   end,
	-- },

	-- new plugins list

	-- ["kevinhwang91/nvim-bqf"] = {ft = "qf"},

	["christoomey/vim-tmux-navigator"] = {},

	["kylechui/nvim-surround"] = {
		config = function()
			require("nvim-surround").setup()
		end,
	},
	["p00f/nvim-ts-rainbow"] = {},
	["echasnovski/mini.align"] = {
		config = function()
			require("mini.align").setup()
		end,
	},
	["echasnovski/mini.starter"] = {
		after = "base46",
		config = function()
			require("mini.align").setup()
		end,
	},
	["echasnovski/mini.sessions"] = {
		config = function()
			require("custom.plugins.miniSessions")
		end,
	},

	-- code formatting, linting etc
	["jose-elias-alvarez/null-ls.nvim"] = {
		after = "nvim-lspconfig",
		config = function()
			require("custom.plugins.null-ls")
		end,
	},

	-- remove plugin
	-- ["hrsh7th/cmp-path"] = false,
}

return plugins
