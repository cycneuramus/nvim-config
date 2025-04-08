return {
	"folke/snacks.nvim",
	event = "BufReadPost", -- Otherwise `indent` will cause text flicker
	-- NOTE: plugin is disabled
	enabled = false,
	config = function()
		require("snacks").setup({
			-- bigfile = { enabled = true },
			-- quickfile = { enabled = true },
			-- indent = {
			-- 	animate = { enabled = false },
			-- 	scope = {
			-- 		enabled = true,
			-- 		priority = 1,
			-- 		hl = "SnacksIndent",
			-- 	},
			-- 	indent = {
			-- 		enabled = false,
			-- 	},
			-- },
			-- notifier = {
			-- 	enabled = true,
			-- 	top_down = false,
			-- 	style = "compact",
			-- },
		})
	end,
}
