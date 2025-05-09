local filetypes = {
    "awk",
    "bash",
    "caddy",
    "desktop",
    "diff",
    "dockerfile",
    "editorconfig",
    "git_config",
    "git_rebase",
    "gitattributes",
    "gitcommit",
    "gitignore",
    "go",
    "gomod",
    "gosum",
    "gpg",
    "hcl",
    "hjson",
    "html",
    "http",
    "ini",
    "jinja",
    "json",
    "jsonc",
    "luadoc",
    "luap",
    "markdown",
    "markdown_inline",
    "nim",
    "nim_format_string",
    "printf",
    "python",
    "regex",
    "requirements",
    "rust",
    "ssh_config",
    "sway",
    "terraform",
    "toml",
    "udev",
    "vim",
    "vimdoc",
    "xml",
    "yaml",
}

return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "VeryLazy" },
    init = function()
        -- Ensure syntax highlighting of Markdown code blocks works with render-markdown.nvim
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "markdown",
            once = true,
            callback = function()
                require("lazy").load({ plugins = { "nvim-treesitter" }, wait = true })
            end,
        })
    end,
    cond = function()
        return vim.api.nvim_buf_line_count(0) < 10000
    end,
    config = function()
        require("nvim-treesitter.configs").setup({
            auto_install = true,
            ensure_installed = filetypes,
            highlight = { enable = true },
            indent = { enable = true },
            additional_vim_regex_highlighting = false,
        })
    end,
}
