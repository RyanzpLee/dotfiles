local augroup = require('cnull.core.event').augroup
local nmap = require('cnull.core.keymap').nmap
local telescope = require('telescope')
local telescope_builtin = require('telescope.builtin')

telescope.setup({
  defaults = {
    path_display = { truncate = 1 },
    prompt_prefix = '   ',
    layout_config = { prompt_position = 'top' },
    layout_strategy = 'horizontal',
    sorting_strategy = 'ascending',
    use_less = false,
    file_ignore_patterns = { '.git/' }
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
    }
  }
})

require('telescope').load_extension('fzf')



-- Normal file finder
local function find_files()
  telescope_builtin.find_files({
    find_command = { 'rg', '--files', '--iglob', '!.git', '--hidden' },
    -- previewer = true,
  })
end

nmap('<C-p>', find_files)

-- Git file finder
local function find_git_files()
  telescope_builtin.git_files()
end

nmap('<Leader>pf', find_git_files)

-- Find helpers
local function help_tags()
  telescope_builtin.help_tags()
end

nmap('<Leader>ph', help_tags)

-- Old files
local function old_files()
  telescope_builtin.oldfiles({ prompt_title = 'History' })
end

nmap('<Leader>h', old_files)

-- Code finder
local function live_grep()
  telescope.extensions.live_grep_raw.live_grep_raw()
end

nmap('<C-t>', live_grep)

-- Config file finder
local function find_config_files()
  local configdir = vim.fn.stdpath('config')

  telescope_builtin.find_files({
    find_command = { 'rg', '--files', '--iglob', '!.git', '--hidden', configdir },
    previewer = true,
  })
end

nmap('<Leader>vf', find_config_files)

augroup('telescope_user_events', {
  {
    event = 'ColorScheme',
    exec = 'highlight! TelescopeBorder guifg=#aaaaaa',
  },
})
