local keymap = vim.keymap
-- Leader key
vim.g.mapleader = " "

keymap.set("n", "<C-a>", "gg<S-v>G")
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>ca", function()
	require("cellular-automaton").start_animation("make_it_rain")
end)
