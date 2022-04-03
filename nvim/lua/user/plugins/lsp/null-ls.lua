local M = {}

local lsputils = require "user.plugins.lsp.utils"

CONFIG = {}

function M.setup()
  local nls = require "null-ls"
  local sources = {
    nls.builtins.formatting.prettierd,
    nls.builtins.formatting.eslint_d,
    nls.builtins.code_actions.gitsigns,
    nls.builtins.formatting.prettier,
    nls.builtins.formatting.stylua,
  }
  nls.config { sources = sources }

  lsputils.setup_server("null-ls", CONFIG)
end

return M
