local function map_surround(lhs, pre, post, desc)
    vim.keymap.set("v", lhs, string.format("c%s<ESC>pa%s<ESC>", pre, post), { buffer = true, desc = desc })
end

-- TODO: move to surround plugin?
map_surround("<C-b>", "**", "**", "Bold")
map_surround("<C-i>", "*", "*", "Italic")
map_surround("<C-'>", "`", "`", "Code")
map_surround("<C-x>", "~~", "~~", "Strikethrough")
map_surround("<C-l>", "[", "]()", "Link")

-- Make for a clean buffer
vim.opt_local.number = false
vim.opt_local.signcolumn = "no"

-- Continue list items on newline (using commentstrings)
vim.opt_local.comments = { "b:*", "b:-", "b:+", "n:>" }
vim.opt_local.formatoptions:append("ro")

-- Workaround for https://github.com/MeanderingProgrammer/render-markdown.nvim/issues/204
-- vim.opt_local.wrap = false
-- vim.opt_local.textwidth = 88
-- vim.opt_local.formatoptions:append("t")
