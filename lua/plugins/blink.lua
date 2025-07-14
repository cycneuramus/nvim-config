return {
    "saghen/blink.cmp",
    version = "1.*",
    event = "InsertEnter",
    config = function()
        require("blink.cmp").setup({
            keymap = {
                preset = "enter",
                ["<Tab>"] = { "select_next", "fallback" },
                ["<S-Tab>"] = { "select_prev", "fallback" },
            },
            fuzzy = { implementation = "prefer_rust_with_warning" },
            cmdline = {
                enabled = true,
                menu = { auto_show = false },
                keymap = {
                    ["<CR>"] = { "accept_and_enter", "fallback" },
                },
            },
            signature = {
                enabled = true,
                -- window = { show_documentation = false },
            },
            sources = {
                default = { "lsp", "path", "buffer" },
                per_filetype = {
                    markdown = { "path" },
                },
            },
            completion = {
                accept = {
                    auto_brackets = {
                        enabled = true,
                    },
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
                        treesitter = { "lsp" },
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
