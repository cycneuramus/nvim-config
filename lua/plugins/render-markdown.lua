return {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = "markdown",
    config = function()
        local nord = require("nord.colors").palette
        vim.api.nvim_set_hl(0, "RenderMarkdownH1Bg", { fg = nord.frost.artic_water })
        vim.api.nvim_set_hl(0, "RenderMarkdownH2Bg", { fg = nord.frost.ice })
        vim.api.nvim_set_hl(0, "RenderMarkdownH3Bg", { fg = nord.aurora.green })
        vim.api.nvim_set_hl(0, "RenderMarkdownH4Bg", { fg = nord.aurora.yellow })
        vim.api.nvim_set_hl(0, "RenderMarkdownH5Bg", { fg = nord.aurora.orange })
        vim.api.nvim_set_hl(0, "RenderMarkdownH6Bg", { fg = nord.aurora.purple })

        require("render-markdown").setup({
            heading = {
                position = "inline",
            },
            overrides = {
                buftype = {
                    nofile = { enabled = false },
                },
            },
        })
    end,
}
