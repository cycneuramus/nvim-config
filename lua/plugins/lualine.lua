return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    init = function()
        vim.g.lualine_laststatus = vim.o.laststatus
        if vim.fn.argc(-1) > 0 then
            -- set an empty statusline till lualine loads
            vim.o.statusline = " "
        else
            -- hide the statusline on the starter page
            vim.o.laststatus = 0
        end
    end,
    opts = function()
        vim.o.laststatus = vim.g.lualine_laststatus
        local diag = require("utils.diagnostics")

        local opts = {
            options = {
                icons_enabled = true,
                theme = "auto",
                -- component_separators = { left = "", right = "" },
                -- section_separators = { left = "", right = "" },
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                always_show_tabline = true,
                globalstatus = true,
                refresh = {
                    statusline = 100,
                    tabline = 100,
                    winbar = 100,
                },
            },
            sections = {
                lualine_a = {
                    {
                        "mode",
                        separator = { left = "", right = "" },
                    },
                },
                lualine_b = {
                    {
                        function()
                            return "󰑊 REC @" .. vim.fn.reg_recording()
                        end,
                        cond = function()
                            return vim.fn.reg_recording() ~= ""
                        end,
                        color = "ErrorMsg",
                        separator = { left = "", right = "" },
                    },
                    {
                        "branch",
                        separator = { left = "", right = "" },
                    },
                    {
                        "diagnostics",
                        separator = { left = "", right = "" },
                        symbols = {
                            error = diag.symbols.error .. " ",
                            warn = diag.symbols.warn .. " ",
                            info = diag.symbols.info .. " ",
                            hint = diag.symbols.hint .. " ",
                        },
                    },
                },
                lualine_c = {
                    {
                        "filetype",
                        icon_only = true,
                        padding = { right = 0, left = 1 },
                    },
                    "filename",
                },
                lualine_x = {},
                lualine_y = {
                    {
                        "lsp_status",
                        icon = "",
                        separator = { left = "", right = "" },
                        symbols = {
                            done = "",
                        },
                    },
                },
                lualine_z = {
                    {
                        "location",
                        separator = { left = "", right = "" },
                    },
                },
            },
        }
        return opts
    end,
}
