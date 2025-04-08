-- Flatten nested color table
local function flatten(palette)
	local colors = {}
	for _, section in pairs(palette) do
		if type(section) == "table" then
			for _, hex in pairs(section) do
				table.insert(colors, hex)
			end
		end
	end
	return colors
end

local nord_palette = require("nord.colors").palette

return {
	"rachartier/tiny-devicons-auto-colors.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"gbprod/nord.nvim",
	},
	enabled = true,
	event = "VeryLazy",
	config = function()
		require("tiny-devicons-auto-colors").setup({
			colors = flatten(nord_palette),
			cache = {
				enabled = true,
				path = vim.fn.stdpath("cache") .. "/tiny-devicons-auto-colors-cache.json",
			},
			precise_search = {
				enabled = true,
				iteration = 10,
				precision = 20,
				threshold = 23,
			},
		})
	end,
}
