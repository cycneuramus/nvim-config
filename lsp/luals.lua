vim.lsp.config.luals = {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = { "lazy-lock.json" },
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME,
                    -- Depending on the usage, you might want to add additional paths here.
                    -- "${3rd}/luv/library",
                    -- "${3rd}/busted/library",
                },
            },
            telemetry = {
                enable = false,
            },
        },
    },
}
