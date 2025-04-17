local diag = require("utils.diagnostics")

vim.diagnostic.config({
    update_in_insert = false,
    underline = false,
    severity_sort = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = diag.symbols.error,
            [vim.diagnostic.severity.WARN] = diag.symbols.warn,
            [vim.diagnostic.severity.INFO] = diag.symbols.info,
            [vim.diagnostic.severity.HINT] = diag.symbols.hint,
        },
    },
})
