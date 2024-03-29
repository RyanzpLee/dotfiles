local buf_option = vim.api.nvim_buf_set_option
local buf_keymap = require("lib.utils").buf_keymap

local M = {}

M.setup = function()
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		virtual_text = true,
		signs = {
			active = signs,
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}
	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

local function lsp_auto_format(client)
	if client.server_capabilities.documentFormattingProvider then
		vim.cmd([[
            augroup formatting
            autocmd! * <buffer>
            autocmd BufWritePre <buffer> lua vim.lsp.buf.format()
            augroup END
	]])
	end
end

local function lsp_keymaps(bufnr)
	buf_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	buf_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
	buf_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
	buf_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
	buf_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
	buf_keymap(bufnr, "n", "<leader>sh", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
	buf_keymap(bufnr, "n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
	buf_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
	buf_keymap(bufnr, "n", "gr", ":Telescope lsp_references<CR>")

	buf_keymap(bufnr, "n", "<leader>ca", ":CodeActionMenu<CR>")
	buf_keymap(bufnr, "v", "<leader>ca", ":CodeActionMenu<CR>")
	buf_keymap(bufnr, "n", "<leader>do", "<cmd>lua vim.diagnostic.open_float()<CR>")
	buf_keymap(bufnr, "n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
	buf_keymap(bufnr, "n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>")
	buf_keymap(bufnr, "n", "<leader>dl", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>")
	buf_keymap(bufnr, "n", "<space>fo", "<cmd>lua vim.lsp.buf.format()<CR>")
	buf_keymap(bufnr, "n", "<space>F", "<cmd>LspToggleAutoFormat<CR>")
	buf_keymap(bufnr, "n", "<leader>so", [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]])
end

M.on_attach = function(client, bufnr)
	if client.name == "tsserver" then
		client.server_capabilities.documentFormattingProvider = false
	end

	if client.name == "sumneko_lua" then
		client.server_capabilities.documentFormattingProvider = false
	end

	if client.name == "jsonls" then
		client.server_capabilities.documentFormattingProvider = false
	end

	if client.name == "yamlls" then
		client.server_capabilities.documentFormattingProvider = false
	end

	lsp_keymaps(bufnr)
	lsp_auto_format(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	return
end

M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

function M.enable_format_on_save()
	vim.cmd([[
    augroup format_on_save
      autocmd! 
      autocmd BufWritePre * lua vim.lsp.buf.format()
    augroup end
  ]])
	vim.notify("Enabled format on save")
end

function M.disable_format_on_save()
	M.remove_augroup("format_on_save")
	vim.notify("Disabled format on save")
end

function M.toggle_format_on_save()
	if vim.fn.exists("#format_on_save#BufWritePre") == 0 then
		M.enable_format_on_save()
	else
		M.disable_format_on_save()
	end
end

function M.remove_augroup(name)
	if vim.fn.exists("#" .. name) == 1 then
		vim.cmd("au! " .. name)
	end
end

vim.cmd([[ command! LspToggleAutoFormat execute 'lua require("user.plugins.lsp.handlers").toggle_format_on_save()' ]])

return M
