return {
  {
    "phaazon/hop.nvim", -- easymotion
    lazy = false,
    config = function()
      require("hop").setup({
        keys = "abcdefghijklmnopqrstuvwxy",
      })

      -- map navigation
      vim.keymap.set({ "n" }, "s", function()
        vim.cmd("normal! ma") -- Marks the current position as 'a'
        vim.cmd("HopChar1")   -- Executes the `HopChar1` command
      end)
      vim.keymap.set({ "v" }, "s", function()
        vim.cmd("HopChar1") -- Executes the `HopChar1` command
      end)
    end,
  },
}
