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
    branch = "main",
    event = { "VeryLazy" },
    init = function()
        local alreadyInstalled = require("nvim-treesitter.config").get_installed()
        local parsersToInstall = vim.iter(filetypes)
            :filter(function(parser)
                return not vim.tbl_contains(alreadyInstalled, parser)
            end)
            :totable()
        require("nvim-treesitter").install(parsersToInstall)
        -- Tree-sitter indentation conditional on the existence of an indendation query
        vim.api.nvim_create_autocmd("FileType", {
            callback = function(ev)
                pcall(vim.treesitter.start, ev.buf)

                local ft = vim.bo[ev.buf].filetype
                local lang = vim.treesitter.language.get_lang(ft)

                if lang and vim.treesitter.query.get(lang, "indents") then
                    vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                else
                    vim.bo[ev.buf].indentexpr = ""
                    vim.bo[ev.buf].autoindent = true
                end
            end,
        })
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
        require("nvim-treesitter").setup({
            auto_install = true,
            ensure_installed = filetypes,
            highlight = { enable = true },
            indent = { enable = true },
            additional_vim_regex_highlighting = false,
        })
    end,
}
