require('lint').linters_by_ft = {
  typescript = {'eslint'},
  javascript = {'eslint'},
  markdown = {'markdownlint', 'proselint'},
}

vim.cmd([[
  augroup NvimLint
    au!
    au BufRead * lua require('lint').try_lint()
    au BufWritePost * lua require('lint').try_lint()
  augroup end
]])
