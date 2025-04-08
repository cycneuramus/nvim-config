local function map_surround(lhs, pre, post, desc)
	vim.keymap.set("v", lhs, string.format("c%s<ESC>pa%s<ESC>", pre, post), { buffer = true, desc = desc })
end

map_surround("<C-b>", "**", "**", "Bold")
map_surround("<C-i>", "*", "*", "Italic")
map_surround("<C-'>", "`", "`", "Code")
map_surround("<C-x>", "~~", "~~", "Strikethrough")
map_surround("<C-l>", "[", "]()", "Link")

-- Continue list items on newline (using commentstrings)
vim.opt_local.comments = { "b:*", "b:-", "b:+", "n:>" }
vim.opt_local.formatoptions:append("ro")

-- vim.api.nvim_command("ZenMode")
