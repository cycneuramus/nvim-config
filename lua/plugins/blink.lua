return {
    "saghen/blink.cmp",
    version = "1.*",
    event = "VeryLazy",
    config = function()
        require("blink.cmp").setup({
            keymap = {
                preset = "super-tab",
            },
            fuzzy = { implementation = "prefer_rust_with_warning" },
            cmdline = {
                enabled = true,
            },
            signature = {
                enabled = true,
                -- window = { show_documentation = false },
            },
            sources = {
                default = { "lsp" },
            },
            completion = {
                accept = {
                    auto_brackets = { enabled = true },
                },
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 500,
                    window = {
                        border = "rounded",
                    },
                },
                menu = {
                    border = "rounded",
                    scrollbar = false,
                    winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
                    draw = {
                        columns = {
                            { "label", "label_description", gap = 1 },
                            { "kind_icon", "kind", gap = 1 },
                        },
                    },
                },
            },
        })
    end,
}
