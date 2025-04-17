local days = function(n)
    return n * 24 * 60 * 60
end

-- Ensure mason bin dir is added to vim path
local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"
if not string.find(vim.env.PATH, mason_bin, 1, true) then
    vim.env.PATH = vim.env.PATH .. ":" .. mason_bin
end

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        "--single-branch",
        "--depth 1",
        lazyrepo,
        lazypath,
    })

    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})

        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Setup plugins
require("lazy").setup({
    spec = {
        { import = "plugins" },
    },
    -- defaults = {
    --  version = "*", -- install latest stable of plugins that support semver
    -- },
    install = {
        colorscheme = { "nord" },
    },
    ui = {
        border = "rounded",
    },
    change_detection = {
        enabled = false,
    },
    checker = {
        enabled = true,
        notify = true,
        frequency = days(30),
    },
    performance = {
        cache = { enabled = true },
        rtp = {
            disabled_plugins = {
                "editorconfig",
                "gzip",
                "man",
                "matchit",
                "netrwPlugin",
                "rplugin",
                "spellfile",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
})
