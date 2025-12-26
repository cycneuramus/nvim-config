local servers = {
    "ansiblels",
    "bashls",
    "gopls",
    "luals",
    "nimlangserver",
    -- "nimlsp",
    "pyright",
}

-- Drop noisy info-level status toasts from nimlangserver
local orig = vim.lsp.handlers["window/showMessage"]
vim.lsp.handlers["window/showMessage"] = function(err, params, ctx, config)
    local client = vim.lsp.get_client_by_id(ctx.client_id)
    if client and client.name == "nimlangserver" then
        if params and params.type == vim.lsp.protocol.MessageType.Info then
            local msg = params.message or ""
            if msg:match("^Nimsuggest initialized") or msg:match("^Opening ") then
                return
            end
        end
    end
    return orig(err, params, ctx, config)
end

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
