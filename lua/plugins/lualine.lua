return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy",
	init = function()
		vim.g.lualine_laststatus = vim.o.laststatus
		if vim.fn.argc(-1) > 0 then
			-- set an empty statusline till lualine loads
			vim.o.statusline = " "
		else
			-- hide the statusline on the starter page
			vim.o.laststatus = 0
		end
	end,
	opts = function()
		vim.o.laststatus = vim.g.lualine_laststatus
		local opts = {
			options = {
				icons_enabled = true,
				theme = "auto",
				-- component_separators = { left = "", right = "" },
				-- section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				always_show_tabline = true,
				globalstatus = true,
				refresh = {
					statusline = 100,
					tabline = 100,
					winbar = 100,
				},
			},
			sections = {
				lualine_a = {
					"mode",
				},
				lualine_b = {
					{
						function()
							return "REC @" .. vim.fn.reg_recording()
						end,
						cond = function()
							return vim.fn.reg_recording() ~= ""
						end,
						-- draw_empty = false,
						color = "ErrorMsg",
						separator = "",
					},
				},
				lualine_c = {
					"branch",
					"diagnostics",
					"buffers",
				},
				lualine_x = {},
				lualine_y = {
					{
						"lsp_status",
						icon = "",
						symbols = {
							done = "",
						},
					},
				},
				lualine_z = { "location" },
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		}
		return opts
	end,
}
