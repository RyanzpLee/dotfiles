
local fg = '#F8F8F2' -- DraculaFg
local bg = '#21222C' -- DraculaBgDark
local separator = '#424450' -- DraculaSubtle

require('lualine').setup {
  options = {
    component_separators = '',
    section_separators = '▕',
    theme = {
      normal = {
        a = { fg = fg, bg = bg },
        b = { fg = fg, bg = bg },
        c = { fg = fg, bg = bg },
        x = { fg = fg, bg = bg },
        y = { fg = fg, bg = bg },
        z = { fg = fg, bg = bg },
      },
      inactive = { c = { fg = fg, bg = bg } },
    },
  },
  sections = {
    lualine_a = {
      'mode',
      { '"▏"', color = { fg = separator } },
    },
    lualine_b = {
      'branch',
      'diff',
      { '"▕"', color = { fg = separator } },
      '"🐳 🐼" .. tostring(#vim.tbl_keys(vim.lsp.buf_get_clients()))',
      { 'diagnostics', sources = { 'nvim_diagnostic' } },
      { '"▏"', color = { fg = separator } },
    },
    lualine_c = { 'filename' },
    lualine_x = {
      'filetype',
      'encoding',
      'fileformat',
    },
    lualine_y = {
      { '"▕"', color = { fg = separator } },
      '(vim.bo.expandtab and "␠ " or "⇥ ") .. "🐼" .. vim.bo.shiftwidth',
      { '"▏"', color = { fg = separator } },
    },
    lualine_z = {
      'location',
      'progress',
    },
  },
}
