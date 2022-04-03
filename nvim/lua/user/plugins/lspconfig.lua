local buf_option = vim.api.nvim_buf_set_option
local buf_keymap = require 'lib.utils'.buf_keymap
local lsp_installer = require('nvim-lsp-installer')

vim.diagnostic.config {
  virtual_text = false,
  severity_sort = true,
  float = {
    source = true,
    focus = false,
    format = function(diagnostic)
      if diagnostic.user_data ~= nil and diagnostic.user_data.lsp.code ~= nil then
        return string.format("%s: %s", diagnostic.user_data.lsp.code, diagnostic.message)
      end
      return diagnostic.message
    end,
  }
}

local on_attach = function(_, bufnr)
  buf_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  buf_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
  buf_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
  buf_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
  buf_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
  buf_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
  buf_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
  buf_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
  buf_keymap(bufnr, 'n', 'gr', ':Telescope lsp_references<CR>')

  -- buf_keymap(bufnr, 'n', '<leader>ca', ':Telescope lsp_code_actions<CR>')
  -- buf_keymap(bufnr, 'v', '<leader>ca', ':Telescope lsp_range_code_actions<CR>')
  buf_keymap(bufnr, 'n', '<leader>ca', ':CodeActionMenu<CR>')
  buf_keymap(bufnr, 'v', '<leader>ca', ':CodeActionMenu<CR>')

  buf_keymap(bufnr, 'n', '<leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>')
  buf_keymap(bufnr, 'n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
  buf_keymap(bufnr, 'n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
  buf_keymap(bufnr, 'n', '<leader>dl', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>')
  -- buf_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')
  -- buf_keymap(bufnr, 'n', '<leader>so', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]])
  -- vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

-- nvim-cmp supports additional completion capabilities
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

lsp_installer.on_server_ready(function(server)
    local opts = {
        capabilities = capabilities,
        on_attach = on_attach,
        root_dir = vim.loop.cwd,
        autostart = true,
        settings = {
            Lua = {
                diagnostics = { globals = {'vim'} }
            },
        },
    }

    server:setup(opts)
end)

-- require'lspconfig'.bashls.setup{
--   on_attach = on_attach,
--   capabilities = capabilities,
--   flags = {
--     debounce_text_changes = 150,
--   },
-- }

-- require'lspconfig'.emmet_ls.setup{
--   on_attach = on_attach,
--   capabilities = capabilities,
--   root_dir = vim.loop.cwd,
--   flags = {
--     debounce_text_changes = 150,
--   },
-- }

-- require'lspconfig'.html.setup{
--   on_attach = on_attach,
--   capabilities = capabilities,
--   root_dir = vim.loop.cwd,
--   flags = {
--     debounce_text_changes = 150,
--   },
-- }

-- require'lspconfig'.eslint.setup{
--   on_attach = on_attach,
--   capabilities = capabilities,
--   root_dir = vim.loop.cwd,
--   flags = {
--     debounce_text_changes = 150,
--   },
--   handlers = {
--     ['window/showMessageRequest'] = function(_, result, _) return result end,
--   },
-- }

-- require'lspconfig'.jsonls.setup{
--   on_attach = on_attach,
--   capabilities = capabilities,
--   root_dir = vim.loop.cwd,
--   flags = {
--     debounce_text_changes = 150,
--   },
--   settings = {
--     json = {
--       schemas = require('schemastore').json.schemas()
--     }
--   }
-- }
-- require'lspconfig'.tsserver.setup{
--   on_attach = on_attach,
--   capabilities = capabilities,
--   root_dir = vim.loop.cwd,
--   flags = {
--     debounce_text_changes = 150,
--   },
-- }
-- local sumneko_binary_path = vim.fn.exepath('lua-language-server')
-- local sumneko_root_path = vim.fn.fnamemodify(sumneko_binary_path, ':h:h:h')

-- local runtime_path = vim.split(package.path, ';')
-- table.insert(runtime_path, "lua/?.lua")
-- table.insert(runtime_path, "lua/?/init.lua")

-- require'lspconfig'.sumneko_lua.setup {
--     cmd = {sumneko_binary_path, "-E", sumneko_root_path .. "/main.lua"};
--     settings = {
--         Lua = {
--         runtime = {
--             -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--             version = 'LuaJIT',
--             -- Setup your lua path
--             path = runtime_path,
--         },
--         diagnostics = {
--             -- Get the language server to recognize the `vim` global
--             globals = {'vim'},
--         },
--         workspace = {
--             -- Make the server aware of Neovim runtime files
--             library = vim.api.nvim_get_runtime_file("", true),
--         },
--         -- Do not send telemetry data containing a randomized but unique identifier
--         telemetry = {
--             enable = false,
--         },
--         },
--     },
-- }

vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })

-- suppress error messages from lang servers
vim.notify = function(msg, log_level, _)
  if msg:match 'exit code' then
    return
  end
  if log_level == vim.log.levels.ERROR then
    vim.api.nvim_err_writeln(msg)
  else
    vim.api.nvim_echo({ { msg } }, true, {})
  end
end
