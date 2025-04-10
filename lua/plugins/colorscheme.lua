return {
    "gbprod/nord.nvim",
    -- lazy = false,
    event = "UIEnter",
    priority = 1000,
    config = function()
        require("nord").setup({
            transparent = true,
            terminal_colors = true,
            borders = true,
            search = { theme = "vscode" },
        })
        vim.cmd.colorscheme("nord")
    end,
}
