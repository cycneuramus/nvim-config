return {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                ["python"] = { "ruff_format", "ruff" },
                ["go"] = { "gofmt", "goimports" },
                ["lua"] = { "stylua" },
                ["sh"] = { "shfmt" },
                ["nim"] = { "nimpsort", "nph" },
                ["hcl"] = { "nomadfmt" },
                ["json"] = { "prettierd" },
                ["yaml"] = { "prettierd" },
                ["yaml.ansible"] = { "prettierd" },
                ["markdown"] = { "mdformat" },
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_format = "fallback",
            },
            formatters = {
                mdformat = {
                    prepend_args = { "--number" },
                },
                stylua = {
                    prepend_args = { "--indent-type", "Spaces" },
                },
                shfmt = {
                    prepend_args = { "-ci", "-sr" },
                },
                nimpsort = {
                    inherit = false,
                    command = "nimpsort",
                    args = { "$FILENAME" },
                    stdin = false,
                },
                nph = {
                    inherit = false,
                    command = "nph",
                    args = { "$FILENAME" },
                    stdin = false,
                },
                nomadfmt = {
                    inherit = false,
                    command = "nomad",
                    args = { "fmt", "-" },
                },
            },
        })
    end,
}
