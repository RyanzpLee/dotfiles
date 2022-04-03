local buf_option = vim.api.nvim_buf_set_option
local buf_keymap = require'lib.utils'.buf_keymap
local lsp_installer = require 'nvim-lsp-installer'
local lspconfig = require 'lspconfig'

-- Formatting via efm
local prettier = require "efm/prettier"
local eslint = require "efm/eslint"

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
        end
    }
}

local on_attach = function(_, bufnr)
    buf_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    buf_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
    buf_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
    buf_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
    buf_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
    buf_keymap(bufnr, 'n', '<leader>sh', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
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
    buf_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')
    buf_keymap(bufnr, 'n', '<leader>so', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]])
    vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

-- nvim-cmp supports additional completion capabilities
local capabilities = require'cmp_nvim_lsp'.update_capabilities(vim.lsp.protocol.make_client_capabilities())

lsp_installer.on_server_ready(function(server)
    local default_opts = {
        capabilities = capabilities,
        on_attach = on_attach,
        autostart = true,
        settings = {
            Lua = {
                diagnostics = {
                    globals = {'vim'}
                }
            }
        }
    }
    local server_opts = {
        ['sumneko_lua'] = function()
            default_opts = {
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = {'vim'}
                        }
                    }
                }

            }
        end,
        ['tsserver'] = function()
            default_opts = {
                on_attach = function(client, bufnr)
                    client.resolved_capabilities.document_formatting = false
                    local ts_utils = require 'nvim-lsp-ts-utils'
                    ts_utils.setup {}
                    ts_utils.setup_client(client)
                    on_attach(client, bufnr)
                end,
                settings = {
                    documentFormatting = false
                },
                init_options = {
                    hostInfo = "neovim"
                },
                capabilities = capabilities
            }
        end,

        ['efm'] = function()
            default_opts = {
                root_dir = vim.loop.cwd,
                init_options = {
                    documentFormatting = true
                },
                settings = {
                    rootMarkers = {".git/"},
                    languages = {
                        lua = {stylua},
                        -- go = {golint, goimports},
                        typescript = {prettier, eslint},
                        javascript = {prettier, eslint},
                        typescriptreact = {prettier, eslint},
                        javascriptreact = {prettier, eslint},
                        yaml = {prettier},
                        json = {prettier},
                        html = {prettier},
                        scss = {prettier},
                        css = {prettier},
                        markdown = {prettier},
                    }
                },
                on_attach = function(client)
                    client.resolved_capabilities.document_formatting = true
                    on_attach(client)
                end
            }
        end

    }
    local server_options = server_opts[server.name] and server_opts[server.name]() or default_opts
    server:setup(server_options)
end)

-- lspconfig.bashls.setup{
--   on_attach = on_attach,
--   capabilities = capabilities,
--   flags = {
--     debounce_text_changes = 150,
--   },
-- }

-- lspconfig.emmet_ls.setup{
--   on_attach = on_attach,
--   capabilities = capabilities,
--   root_dir = vim.loop.cwd,
--   flags = {
--     debounce_text_changes = 150,
--   },
-- }

-- lspconfig.html.setup{
--   on_attach = on_attach,
--   capabilities = capabilities,
--   root_dir = vim.loop.cwd,
--   flags = {
--     debounce_text_changes = 150,
--   },
-- }

-- lspconfig.eslint.setup{
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

-- lspconfig.jsonls.setup{
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
-- lspconfig.tsserver.setup{
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

-- lspconfig.sumneko_lua.setup {
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

-- local languages = {
--     lua = {luafmt},
--     typescript = {prettier, eslint},
--     javascript = {prettier, eslint},
--     typescriptreact = {prettier, eslint},
--     javascriptreact = {prettier, eslint},
--     yaml = {prettier},
--     json = {prettier},
--     html = {prettier},
--     scss = {prettier},
--     css = {prettier},
--     markdown = {prettier},
--     rust = {rustfmt},
-- }

-- local handle_lsp = function(opts) return opts end

-- lspconfig.efm.setup {
--     root_dir = lspconfig.util.root_pattern("yarn.lock", "lerna.json", ".git"),
--     filetypes = vim.tbl_keys(languages),
--     init_options = {documentFormatting = true, codeAction = true},
--     settings = {languages = languages, log_level = 1, log_file = '~/efm.log'},
--     on_attach = on_attach,
--     capabilities = capabilities
-- }

-- lspconfig.eslint.setup(handle_lsp({
--     root_dir = lspconfig.util.root_pattern("yarn.lock", "lerna.json", ".git"),
--     on_attach = on_attach,
--     capabilities = capabilities
-- }))

vim.fn.sign_define('DiagnosticSignError', {
    text = '',
    texthl = 'DiagnosticSignError'
})
vim.fn.sign_define('DiagnosticSignWarn', {
    text = '',
    texthl = 'DiagnosticSignWarn'
})
vim.fn.sign_define('DiagnosticSignInfo', {
    text = '',
    texthl = 'DiagnosticSignInfo'
})
vim.fn.sign_define('DiagnosticSignHint', {
    text = '',
    texthl = 'DiagnosticSignHint'
})

-- suppress error messages from lang servers
vim.notify = function(msg, log_level, _)
    if msg:match 'exit code' then
        return
    end
    if log_level == vim.log.levels.ERROR then
        vim.api.nvim_err_writeln(msg)
    else
        vim.api.nvim_echo({{msg}}, true, {})
    end
end
