local telescope = require 'telescope'
local actions = require 'telescope.actions'
local keymap = require 'lib.utils'.keymap

-- local purple = '#BD93F9' -- DraculaPurple
-- local fg = '#F8F8F2' -- DraculaFg
-- local bg_light = '#343746' -- DraculaBgLight
-- local bg_lighter = '#44475A' -- DraculaSelection

-- vim.cmd("highlight TelescopeNormal guibg = '" .. bg_light .. "'")
-- vim.cmd("highlight TelescopeBorder guifg = '" .. bg_light .. "' guibg = '" .. bg_light .. "'")
-- vim.cmd("highlight TelescopePromptBorder guifg = '" .. bg_lighter .. "' guibg = '" .. bg_lighter .. "'")
-- vim.cmd("highlight TelescopePromptNormal guifg = '" .. fg .. "' guibg = '" .. bg_lighter .. "'")
-- vim.cmd("highlight TelescopePromptPrefix guifg = '" .. purple .. "' guibg = '" .. bg_lighter .. "'")
-- vim.cmd [[highlight! link TelescopePromptTitle DraculaSearch]]
-- vim.cmd [[highlight! link TelescopePreviewTitle WildMenu]]
-- vim.cmd("highlight TelescopeResultsTitle guifg = '" .. bg_light .. "' guibg = '" .. bg_light .. "'")

-- vim.cmd [[highlight! link TelescopeBorder DraculaBgLight]]

telescope.setup {
  defaults = {
    path_display = { 'smart' },
    prompt_prefix = '  ',
    selection_caret = '  ',
    layout_config = {
      prompt_position = 'top',
    },
    sorting_strategy = 'ascending',
    mappings = {
      i = {
        ['<esc>'] = actions.close,
      },
    },
    file_ignore_patterns = { 'dist', 'node_modules', '.git/' },
    vimgrep_arguments = {
      'rg',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--hidden'
    },
  },
  pickers = {
    find_files = {
      find_command = { 'rg', '--files', '--iglob', '!.git', '--hidden' }
    },
    buffers = {
      previewer = false,
      layout_config = {
        width = 80,
      },
    },
    oldfiles = {
      prompt_title = 'History',
    },
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
      hidden = 'true'
    },
  },
}

require('telescope').load_extension 'fzf'

keymap('n', '<leader>ff', [[<cmd>lua require('telescope.builtin').find_files()<CR>]])
keymap('n', '<leader>ps', [[<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>]])
keymap('n', '<leader>pw', [[<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.expand("<cword>")})<CR>]])
keymap('n', '<leader>pf', [[<cmd>lua require('telescope.builtin').git_files()<CR>]])
keymap('n', '<leader>fF', [[<cmd>lua require('telescope.builtin').find_files({ no_ignore = true, prompt_title = 'All Files' })<CR>]]) -- luacheck: no max line length
keymap('n', '<leader>fh', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]])
keymap('n', '<leader>pg', [[<cmd>lua require('telescope').extensions.live_grep_raw.live_grep_raw()<CR>]])
keymap('n', '<leader>pb', [[<cmd>lua require('telescope.builtin').buffers()<CR>]])
keymap('n', '<leader>ph', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]])

keymap('n', '<leader>gb', [[<cmd>lua require('telescope.builtin').git_branches()<CR>]])
