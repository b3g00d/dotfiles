return {
	"mistweaverco/kulala.nvim",
	ft = { "http", "rest" },
	opts = {
		-- your configuration comes here
		global_keymaps = {
			["Send request"] = { -- sets global mapping
				"<CR>",
				function()
					require("kulala").run()
				end,
				mode = { "n", "v" }, -- optional mode, default is n
				desc = "Send request", -- optional description, otherwise inferred from the key
			},
		},
	},
}

