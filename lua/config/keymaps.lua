local map = vim.keymap.set

-- More intuitive redo
map("n", "U", "<C-r>", { desc = "Redo" })

-- Prevent common mistake of q: instead of :q
map("n", "q:", ":q", { desc = "Quit (correct q: typo)" })

-- Remap potentially harmful all-lowercase command
map("v", "u", "<Nop>", { desc = "Disable lowercase 'u' in visual mode" })

-- Leverage blackhole register
map("n", "x", '"_x', { desc = "Delete character without yanking" })
map("n", "c", '"_c', { desc = "Change without yanking" })

-- Searching
map({ "n", "o" }, "-", "/", { silent = false, desc = "Search forward" })
map("n", "_", ":%s//g<Left><Left>", { silent = false, desc = "Substitute in file" })
map("x", "_", ":s//g<Left><Left>", { silent = false, desc = "Substitute in selection" })

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move line down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move line up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move selection down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move selection up" })

-- Escaping
local nohEsc = "<cmd>nohlsearch<CR><esc>"
map("n", "<ESC>", nohEsc, { desc = "Clear search highlight" })
map({ "n", "v", "i" }, "<C-c>", nohEsc, { desc = "Clear search highlight (C-c)" })

-- Easier square brackets (for e.g. mini.bracketed)
map({ "n", "o", "v" }, "å", "[", { remap = true, desc = "Left bracket" })
map({ "n", "o", "v" }, "¨", "]", { remap = true, desc = "Right bracket" })

-- Since the above remaps mark keybinds, do this instead:
map("n", "m'", "'", { noremap = true, desc = "Jump to mark '" })
map("n", "m`", "`", { noremap = true, desc = "Jump to mark `" })

-- Fuzzy finding
map("n", "<leader>f", "<cmd>FzfLua files<CR>", { desc = "Find files" })
map("n", "<leader>b", "<cmd>FzfLua buffers<CR>", { desc = "Find buffers" })
map("n", "<leader>g", "<cmd>FzfLua live_grep_native<CR>", { desc = "Live grep" })
map("n", "<leader>s", "<cmd>FzfLua lsp_document_symbols<CR>", { desc = "Document symbols" })
map("n", "<leader>:", "<cmd>FzfLua command_history<CR>", { desc = "Command history" })

-- LSP
vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function()
		map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
		map("n", "gr", vim.lsp.buf.references, { desc = "Find references" })
		map("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
		map("n", "gs", vim.lsp.buf.signature_help, { desc = "Signature help" })
		map("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename symbol" })
		map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
	end,
})

-- Map j and k to gj/gk, but only when no count is given
map("n", "j", function()
	local count = vim.v.count
	if count == 0 then
		return "gj"
	elseif count > 5 then
		return "m'" .. count .. "j"
	else
		return count .. "j"
	end
end, { expr = true, desc = "Visual line movement (j)" })

map("n", "k", function()
	local count = vim.v.count
	if count == 0 then
		return "gk"
	elseif count > 5 then
		return "m'" .. count .. "k"
	else
		return count .. "k"
	end
end, { expr = true, desc = "Visual line movement (k)" })
