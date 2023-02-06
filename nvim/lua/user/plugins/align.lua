local status_ok, align = pcall(require, "align")
if not status_ok then
	return
end

local NS = { noremap = true, silent = true }

vim.keymap.set("x ", "<leader>ac", function()
	align.align_to_char(1, true)
end, NS) -- Aligns to 1 character, looking left
vim.keymap.set("x ", "<leader>as", function()
	align.align_to_char(2, false, false)
end, NS) -- Aligns to 2 characters, looking left and with previews
vim.keymap.set("x ", "aw", function()
	align.align_to_string(false, true, true)
end, NS) -- Aligns to a string, looking left and with previews

--[[ -- Example gawip to align a paragraph to a string, looking left and with previews ]]
--[[ vim.keymap.set("n", "gaw", function() ]]
--[[ 	align.operator(align.align_to_string, { is_pattern = false, reverse = true, preview = true }) ]]
--[[ end, NS) ]]
--[[]]
-- Example gaaip to aling a paragraph to 1 character, looking left
--[[ vim.keymap.set("n", "gaa", function() ]]
--[[ 	align.operator(align.align_to_char, { length = 1, reverse = true }) ]]
--[[ end, NS) ]]
