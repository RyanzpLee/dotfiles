local parser_config = require('nvim-treesitter.parsers').get_parser_configs();
parser_config.solidity = {
  install_info = {
    url = '~/Code/JoranHonig/tree-sitter-solidity/', -- local path or git repo
    files = { 'src/parser.c' },
  },
}

require('nvim-treesitter.configs').setup {
  ensure_installed = 'maintained',
  indent = {
    enable = { 'typescript', 'html', 'javascript' },
  },
  highlight = {
    enable = true,
    disable = { 'NvimTree' },
    additional_vim_regex_highlighting = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ['ia'] = '@parameter.inner',
      },
    },
  },
  context_commentstring = {
    enable = true,
  },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
}
