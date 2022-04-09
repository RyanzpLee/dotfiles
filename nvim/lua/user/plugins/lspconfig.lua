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

-- lsp_installer.on_server_ready(function(server)
--         ['tsserver'] = function()
--             default_opts = {
--                 on_attach = function(client, bufnr)
--                     client.resolved_capabilities.document_formatting = false
--                     local ts_utils = require 'nvim-lsp-ts-utils'
--                     ts_utils.setup {}
--                     ts_utils.setup_client(client)
--                     on_attach(client, bufnr)
--                 end,
--                 settings = {
--                     documentFormatting = false
--                 },
--                 init_options = {
--                     hostInfo = "neovim"
--                 },
--                 capabilities = capabilities
--             }
--         end
--     }
--     local server_options = server_opts[server.name] and server_opts[server.name]() or default_opts
--     server:setup(server_options)
-- end)

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
