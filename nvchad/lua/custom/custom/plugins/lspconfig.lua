local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local servers = { "html", "cssls", "tsserver", "clangd" , "emmet_ls","pyright","jsonls"}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end


-- local M = {}
--
-- M.setup_lsp = function(attach, capabilities)
--   local command = vim.api.nvim_create_user_command
--   local lspconfig = require('lspconfig')
--   local null_ls = require('null-ls')
--
--   lspconfig.tsserver.setup({
--     on_attach = attach,
--     capabilities = capabilities
--   })
--
--   lspconfig.eslint.setup({
--     on_attach = attach,
--     capabilities = capabilities
--   })
--
--   command('LspFormat', function()
--     -- Use null-ls if present
--     if vim.fn.exists(':NullFormat') == 2 then
--       vim.cmd('NullFormat')
--       return
--     end
--
--     -- Fallback to whatever lsp server has formatting capabilities
--     vim.lsp.buf.formatting()
--   end, {desc = 'Format current buffer'})
--
--
--   null_ls.setup({
--     on_attach = function(client, bufnr)
--       local bufcmd = vim.api.nvim_buf_create_user_command
--       local format = function()
--         local params = vim.lsp.util.make_formatting_params({})
--         client.request('textDocument/formatting', params, nil, bufnr) 
--       end
--
--       if client.server_capabilities.documentFormattingProvider then
--         bufcmd(bufnr, 'NullFormat', format, {desc = 'Format using null-ls'})
--       end
--
--       attach(client, bufnr)
--     end,
--     sources = {
--       null_ls.builtins.formatting.prettier
--     }
--   })
-- end
--
-- return M
