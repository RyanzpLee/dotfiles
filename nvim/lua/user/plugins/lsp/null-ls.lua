local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	on_attach = function(client)
		if client.server_capabilities.documentFormattingProvider then
			vim.cmd([[
	           augroup LspFormatting
	               autocmd! * <buffer>
	               autocmd BufWritePre <buffer> lua vim.lsp.buf.format()
	           augroup END
	           ]])
		end
	end,
	sources = {
		formatting.prettier,
		diagnostics.eslint,
		formatting.stylua,
		formatting.goimports,
		formatting.yamlfmt,
	},
})
