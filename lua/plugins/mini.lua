return {
	"echasnovski/mini.nvim",
	event = "VeryLazy",
	config = function()
		local ai = require("mini.ai")
		ai.setup()

		require("mini.pairs").setup({
			mappings = {
				["("] = { action = "open", pair = "()", neigh_pattern = "[^\\][%s)}%]]" },
				["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\][%s)}%]]" },
				["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\][%s)}%]]" },
				["`"] = { neigh_pattern = "[^%a%d\\%-`][%s)}%]]" },
				['"'] = { neigh_pattern = '[^%a%d\\%-"][%s)}%]]' },
				["'"] = { neigh_pattern = "[^%a%d\\%-'][%s)}%]]" },
			},
		})

		local indentscope = require("mini.indentscope")
		indentscope.setup({
			symbol = "│",
			options = {
				try_as_border = true,
			},
			draw = {
				delay = 0,
				animation = indentscope.gen_animation.none(),
			},
			mappings = {
				-- Handled by mini.bracketed
				goto_top = "",
				goto_bottom = "",
			},
		})
		vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { link = "Whitespace" })

		local hipatterns = require("mini.hipatterns")
		hipatterns.setup({
			highlighters = {
				fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
				hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
				todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
				note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

				-- Highlight hex color strings (`#rrggbb`) using that color
				hex_color = hipatterns.gen_highlighter.hex_color(),
			},
		})

		require("mini.surround").setup({
			search_method = "cover_or_nearest",
			mappings = {
				add = "gsa", -- Add surrounding in Normal and Visual modes
				delete = "gsd", -- Delete surrounding
				find = "gsf", -- Find surrounding (to the right)
				find_left = "gsF", -- Find surrounding (to the left)
				highlight = "gsh", -- Highlight surrounding
				replace = "gsr", -- Replace surrounding
				update_n_lines = "gsn", -- Update `n_lines` "gs"
			},
		})

		require("mini.bracketed").setup({
			buffer = { suffix = "b", options = {} },
			comment = { suffix = "c", options = {} },
			conflict = { suffix = "x", options = {} },
			diagnostic = { suffix = "d", options = { float = false } },
			file = { suffix = "f", options = {} },
			indent = { suffix = "i", options = {} },
			jump = { suffix = "j", options = {} },
			location = { suffix = "l", options = {} },
			oldfile = { suffix = "o", options = {} },
			quickfix = { suffix = "q", options = {} },
			treesitter = { suffix = "t", options = {} },
			-- undo = { suffix = "u", options = {} },
			window = { suffix = "w", options = {} },
			yank = { suffix = "y", options = {} },
		})
	end,
}
