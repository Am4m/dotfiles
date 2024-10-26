local keymap = vim.keymap
-- Leader key
vim.g.mapleader = " "
keymap.set("n", "<C-a>", "gg<S-v>G")
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Define the toggle_terminal function

-- Define the toggle_terminal function
function _G.toggle_terminal()
    -- Check if there's an existing terminal buffer
    local term_buf = vim.fn.bufnr('^term://')

    if term_buf ~= -1 then
        -- If the terminal is open, close it
        vim.api.nvim_buf_delete(term_buf, { force = true })
    else
        -- Calculate the height for 20% of the screen
        local height = math.floor(vim.o.lines * 0.2)
        -- Open the terminal at the bottom with the calculated height
        vim.cmd('botright ' .. height .. 'split | terminal')
        vim.cmd('startinsert')
    end
end

-- Keybinding to toggle terminal
vim.api.nvim_set_keymap('n', '<c-t>', ':lua toggle_terminal()<CR>', { noremap = true, silent = true })
-- Move focus to the left window

