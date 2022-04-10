local keymap = require 'lib.utils'.keymap

keymap('n', '<leader>gs', '<cmd>G<CR>')
-- get the merge from the left hand side
keymap('n', '<leader>ga', '<cmd>diffget //2<CR>')
-- get the merge from the right hand side
keymap('n', '<leader>ga', '<cmd>diffget //3<CR>')
