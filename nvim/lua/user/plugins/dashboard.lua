vim.g.dashboard_custom_header = {
  '',
  '',
  '           ⢸⣿⣿⣿⣿⣿⣿⣿⣷⣦⡀',
  '           ⢸⣿⣿⠈⠈⠈⠁⣿⣷⠁⣦⡀',
  '           ⢸⣿⣿     ⣿⣿⣿⣿⣦⡀',
  '           ⢸⣿⣿     ⠻⣿⣿⣿⣿⣦⡀',
  '           ⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡀',
  '           ⢀⣀⣴⣿⣿⣿⣿  ⠈⠻⣿⣿⣿⣿⡀',
  '           ⠈⠻⣿⣿⣿⠟⠁    ⠈⠻⣿⣿⣿⣦⡀',
  '           ⠈⠻⣿⣿⣿⠿⠛     ⠈⠛⠿⣿⣿⣿⣿⣦⡀',
}

vim.g.dashboard_custom_section = {
  a = { description = { '  New file                       ' }, command = 'enew' },
  b = { description = { '  Find file                 SPC pf' }, command = 'Telescope find_files' },
  c = { description = { '  Recent files              <C-p>' }, command = 'Telescope git_files' },
  d = { description = { '  Find Word                 SPC ps' }, command = 'Telescope grep_string' },
}

vim.g.dashboard_custom_footer = {
  '',
}
