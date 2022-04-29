require('indent_blankline').setup {
  filetype_exclude = {
    'help',
    'terminal',
    'dashboard',
    'packer',
    'lspinfo',
    'TelescopePrompt',
    'TelescopeResults',
  },
  buftype_exclude = { 'terminal', 'NvimTree' },
  space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = true,
}
