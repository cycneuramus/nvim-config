local servers = {
    "ansiblels",
    "bashls",
    "gopls",
    "luals",
    "nimlangserver",
    "pyright",
}

for _, server in pairs(servers) do
    vim.lsp.enable(server)
end

local capabilities = {
    -- semanticTokensProvider = nil,
    textDocument = {
        foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true,
        },
    },
}

capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

vim.lsp.config("*", {
    capabilities = capabilities,
    root_markers = { ".git" },
    on_attach = function(client, _)
        client.server_capabilities.semanticTokensProvider = nil
    end,
})
