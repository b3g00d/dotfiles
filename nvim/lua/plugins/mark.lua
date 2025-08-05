return {
	"chentoast/marks.nvim",
	config = function()
		require("marks").setup({
			default_mappings = false,
			bookmark_0 = {
				sign = "󰃅",
				virt_text = "",
				annotate = false,
			},
			mappings = {},
		})
	end,
}
