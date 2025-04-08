local function map_surround(lhs, pre, post, desc)
	vim.keymap.set("v", lhs, string.format("c%s<ESC>pa%s<ESC>", pre, post), { buffer = true, desc = desc })
end

map_surround("<C-b>", "**", "**", "Bold")
map_surround("<C-i>", "*", "*", "Italic")
map_surround("<C-'>", "`", "`", "Code")
map_surround("<C-x>", "~~", "~~", "Strikethrough")
map_surround("<C-l>", "[", "]()", "Link")

-- vim.api.nvim_command("ZenMode")
