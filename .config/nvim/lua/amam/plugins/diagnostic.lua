return {
    {
        "rachartier/tiny-inline-diagnostic.nvim",
        event = "VeryLazy", -- Or `LspAttach`
        priority = 1000, -- needs to be loaded in first
        config = function()
            require("tiny-inline-diagnostic").setup({})
        end,
    },
    {
        "nvim-lspconfig",
        opts = {
            diagnostics = {
                virtual_text = false,
                signs = true,
            },
        },
    },
}
