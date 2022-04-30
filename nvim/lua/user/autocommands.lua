local group = vim.api.nvim_create_augroup("MyAutogroup", {})

vim.api.nvim_create_autocmd("TextYankPost", {
    group = group,
    pattern = "*",
    callback = function()
        vim.highlight.on_yank { higroup = "HighlightedyankRegion", timeout = 150 }
    end,
})
