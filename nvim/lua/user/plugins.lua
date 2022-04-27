local packer = require("lib.packer-init")

packer.startup(function(use)
    use({ "wbthomason/packer.nvim" }) -- Let packer manage itself

    use({ "airblade/vim-rooter" })
    use({ "christoomey/vim-tmux-navigator" })
    use({ "farmergreg/vim-lastplace" })
    use({ "tpope/vim-surround" })
    use({ "tpope/vim-eunuch" }) -- Adds :Rename, :SudoWrite
    use({ "tpope/vim-unimpaired" }) -- Adds [b and other handy mappings
    use({ "tpope/vim-sleuth" }) -- Indent autodetection with editorconfig support
    use({ "kevinhwang91/nvim-bqf" })

    use({
        "catppuccin/nvim",
        as = "catppuccin",
        config = function()
            require("user.plugins.catppuccin")
        end,
    })

    -- use {
    --   'dracula/vim',
    --   as = 'dracula',
    --   config = function()
    --     require('user.plugins.dracula')
    --   end
    -- }

    use({
        "numToStr/Comment.nvim",
        config = function()
            require("user.plugins.comment")
        end,
    })

    use({
        "mhinz/vim-sayonara",
        config = function()
            require("user.plugins.sayonara")
        end,
    })

    use({
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("user.plugins.indent-blankline")
        end,
    })

    use({
        "windwp/nvim-autopairs",
        config = function()
            require("user.plugins.autopairs")
        end,
    })

    use({
        "akinsho/bufferline.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("user.plugins.bufferline")
        end,
    })

    use({
        "nvim-lualine/lualine.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("user.plugins.lualine")
        end,
    })

    use({
        "kyazdani42/nvim-tree.lua",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("user.plugins.nvim-tree")
        end,
    })

    use({
        "rcarriga/nvim-notify",
        config = function()
            require("user.plugins.notify")
        end,
    })

    use({
        "SmiteshP/nvim-gps",
        requires = "nvim-treesitter/nvim-treesitter",
        config = function()
            require("nvim-gps").setup()
        end
    })

    -- use({
    -- 	"karb94/neoscroll.nvim",
    -- 	config = function()
    -- 		require("user.plugins.neoscroll")
    -- 	end,
    -- })

    use({
        "voldikss/vim-floaterm",
        config = function()
            require("user.plugins.floaterm")
        end,
    })

    use({
        "ThePrimeagen/harpoon",
        config = function()
            require("user.plugins.harpoon")
        end,
    })

    use({
        "nvim-telescope/telescope.nvim",
        requires = {
            { "nvim-lua/plenary.nvim" },
            { "kyazdani42/nvim-web-devicons" },
            { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
            { "nvim-telescope/telescope-live-grep-raw.nvim" },
        },
        config = function()
            require("user.plugins.telescope")
        end,
    })

    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        requires = {
            "nvim-treesitter/playground",
            "nvim-treesitter/nvim-treesitter-textobjects",
            "lewis6991/spellsitter.nvim",
            "JoosepAlviste/nvim-ts-context-commentstring",
            "p00f/nvim-ts-rainbow",
        },
        config = function()
            require("user.plugins.treesitter")
            require("spellsitter").setup()
        end,
    })

    use({
        "tpope/vim-fugitive",
        requires = "tpope/vim-rhubarb",
        config = function()
            require("user.plugins.fugitive")
        end,
    })

    use({
        "lewis6991/gitsigns.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("user.plugins.gitsigns")
        end,
    })

    -- use {
    --   'neoclide/coc.nvim',
    --   branch = 'release',
    -- }

    -- use {
    --   'fannheyward/telescope-coc.nvim'
    -- }

    use({
        "neovim/nvim-lspconfig",
        requires = {
            "williamboman/nvim-lsp-installer",
            "jose-elias-alvarez/nvim-lsp-ts-utils",
            "weilbith/nvim-code-action-menu",
            "b0o/schemastore.nvim",
            "folke/lsp-colors.nvim",
        },
        config = function()
            require("user.plugins.lsp")
        end,
    })

    use({
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            require("user.plugins.lsp.null-ls")
        end,
    })

    use({
        "L3MON4D3/LuaSnip",
        config = function()
            require("user.plugins.luasnip")
        end,
    })

    use({
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-nvim-lsp-signature-help",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "onsails/lspkind-nvim",
        },
        config = function()
            require("user.plugins.cmp")
        end,
    })

    use({
        "luukvbaal/stabilize.nvim",
        config = function()
            require("stabilize").setup()
        end,
    })
end)
