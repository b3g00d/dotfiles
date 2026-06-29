return {
  "mistweaverco/kulala.nvim",
  ft = { "http", "rest" },
  opts = {
    global_keymaps = {
      ["Send request"] = {
        "<CR>",
        function()
          require("kulala").run()
        end,
        mode = { "n", "v" },
        ft = { "http", "rest" }, -- ← THE FIX: chỉ bind trong .http/.rest
        desc = "Send request",
      },
    },
  },
}
