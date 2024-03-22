require "nvchad.options"
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local opt = vim.opt
local mode = vim.api.nvim_get_mode()

-- add yours here!
autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local line = vim.fn.line "'\""
    if
      line > 1
      and line <= vim.fn.line "$"
      and vim.bo.filetype ~= "commit"
      and vim.fn.index({ "xxd", "gitrebase" }, vim.bo.filetype) == -1
    then
      vim.cmd 'normal! g`"'
    end
  end,
})
-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
-- -- Auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

-- Hybrid relative numbers, absolute numbers on entering insert mode or switching panes.
local numberGroup = augroup("numberToggle", {
  clear = false,
})

autocmd({ "BufEnter", "FocusGained", "InsertLeave", "WinEnter", "CmdwinEnter" }, {
  pattern = "*",
  callback = function()
    if opt.nu and mode.mode ~= "i" then
      opt.relativenumber = true
    end
  end,
  group = numberGroup,
})

autocmd({ "BufLeave", "FocusLost", "InsertEnter", "WinLeave", "CmdwinLeave" }, {
  pattern = "*",
  callback = function()
    if opt.nu then
      opt.relativenumber = false
    end
  end,
  group = numberGroup,
})

-- Highlight when yank
local highlight_group = augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})
