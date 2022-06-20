local telescope = require("telescope")
local actions = require("telescope.actions")
local action_layout = require("telescope.actions.layout")
local keymap = require("lib.utils").keymap

telescope.setup({
	defaults = {
		-- path_display = "truncate",
		prompt_prefix = " 🔭 ",
		selection_caret = "  ",
		layout_config = {
			prompt_position = "top",
		},
		sorting_strategy = "ascending",
		mappings = {
			i = {
				["<esc>"] = actions.close,
				["<C-e>"] = action_layout.toggle_preview,
			},
		},
		file_ignore_patterns = { "dist", "node_modules", ".git/", "yarn.lock" },
		vimgrep_arguments = {
			"rg",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--hidden",
			"--trim",
		},
	},
	pickers = {
		find_files = {
			find_command = { "fd", "--type", "f", "--strip-cwd-prefix", "-H" },
		},
		buffers = {
			previewer = false,
			layout_config = {
				width = 80,
			},
		},
		oldfiles = {
			prompt_title = "History",
		},
	},
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			hidden = "true",
		},
	},
})

require("telescope").load_extension("fzf")
-- require('telescope').load_extension 'coc'

keymap("n", "<leader>ff", [[<cmd>lua require('telescope.builtin').find_files()<CR>]])
keymap(
	"n",
	"<leader>ps",
	[[<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>]]
)
keymap(
	"n",
	"<leader>pw",
	[[<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.expand("<cword>")})<CR>]]
)
keymap("n", "<leader>pf", [[<cmd>lua require('telescope.builtin').git_files()<CR>]])
keymap(
	"n",
	"<leader>fF",
	[[<cmd>lua require('telescope.builtin').find_files({ no_ignore = true, prompt_title = 'All Files' })<CR>]]
) -- luacheck: no max line length
keymap("n", "<leader>fh", [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]])
keymap("n", "<leader>pg", [[<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>]])
keymap(
	"n",
	"<leader>pd",
	[[<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args({cwd=vim.fn.expand("%:p:h")})<CR>]]
)

keymap("n", "<leader>pb", [[<cmd>lua require('telescope.builtin').buffers()<CR>]])
keymap("n", "<leader>ph", [[<cmd>lua require('telescope.builtin').help_tags()<CR>]])
-- keymap("n", "<leader>ke", [[<cmd>lua require('telescope.builtin').keymaps()<CR>]])

keymap("n", "<leader>gb", [[<cmd>lua require('telescope.builtin').git_branches()<CR>]])
