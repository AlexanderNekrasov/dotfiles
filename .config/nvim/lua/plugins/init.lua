return {
    "nvim-lua/plenary.nvim",
    {
        "Mofiqul/dracula.nvim",
        priority = 1000,
        lazy = false,
        config = function()
            vim.cmd[[colorscheme dracula]]
        end,
    }
}
