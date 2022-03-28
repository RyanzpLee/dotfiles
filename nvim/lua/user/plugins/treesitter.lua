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
    enable = { 'js', 'html', 'jsx', 'ts', 'tsx' },
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
}
