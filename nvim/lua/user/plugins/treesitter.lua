local swap_next, swap_prev = (function()
    local swap_objects = {
        p = "@parameter.inner",
        f = "@function.outer",
        e = "@element",
    }

    local n, p = {}, {}
    for key, obj in pairs(swap_objects) do
        n[string.format("<Space>s%s", key)] = obj
        p[string.format("<BS>s%s", key)] = obj
    end

    return n, p
end)()

require("nvim-treesitter.configs").setup({
    ensure_installed = "all",
    highlight = {
        enable = true, -- false will disable the whole extension
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
    indent = {
        enable = true,
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
                ["<Leader>sn"] = "@parameter.inner",
            },
            swap_prev = {
                ["<Leader>sp"] = "@parameter.inner",
            },
        },
    },
    context_commentstring = {
        enable = true,
        -- With Comment.nvim. we don't need to run this on the autcmd
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
})
