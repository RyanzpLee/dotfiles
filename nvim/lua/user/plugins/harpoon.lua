local keymap = require("lib.utils").keymap

keymap('n', '<leader>a', [[ <cmd>lua require("harpoon.mark").add_file()<CR> ]])
keymap('n', '<C-e>', [[<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>]])
keymap('n', '<leader>tc', [[<cmd>lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>]])

keymap('n', '<leader>j', [[<cmd>lua require("harpoon.ui").nav_file(1)<CR>]])
keymap('n', '<leader>k', [[<cmd>lua require("harpoon.ui").nav_file(2)<CR>]])
keymap('n', '<leader>l', [[<cmd>lua require("harpoon.ui").nav_file(3)<CR>]])
keymap('n', '<leader>;', [[<cmd>lua require("harpoon.ui").nav_file(4)<CR>]])
