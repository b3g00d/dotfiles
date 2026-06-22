return {
  {
    "smoka7/hop.nvim", -- easymotion (bản fork đang được maintain, thay cho phaazon/hadronized đã archive)
    version = "*", -- pin theo tag stable mới nhất
    lazy = false,
    config = function()
      require("hop").setup {
        keys = "abcdefghijklmnopqrstuvwxy",
      }
      -- map navigation
      vim.keymap.set({ "n" }, "s", function()
        vim.cmd "normal! ma" -- Marks the current position as 'a'
        vim.cmd "HopChar1" -- Executes the `HopChar1` command
      end)
      vim.keymap.set({ "v" }, "s", function()
        vim.cmd "HopChar1" -- Executes the `HopChar1` command
      end)
    end,
  },
}
