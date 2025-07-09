local opt = vim.opt

-- Auto format after pasting text
vim.api.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    callback = function()
        if vim.v.event.operator == "p" then -- Check if the operation was a paste
            vim.lsp.buf.format({ async = true })
        end
    end,
})
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"
opt.number = true
opt.relativenumber = true

opt.wrap = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true

opt.smartindent = true
opt.wrap = false
opt.swapfile = false
opt.backup = false

opt.hlsearch = true
opt.incsearch = true

opt.termguicolors = true
opt.scrolloff = 8
opt.updatetime = 50
opt.isfname:append("@-@")

opt.title = true
opt.mouse = "a"
opt.ttyfast = true

vim.g.snacks_animate = false
opt.hlsearch = false
opt.incsearch = true

vim.cmd.colorscheme("onedark")
