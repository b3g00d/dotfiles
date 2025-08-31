return {
  {
    "zbirenbaum/copilot.lua",
    enabled = false,
    event = "InsertEnter",
    cmd = "Copilot",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          keymap = {
            accept = "<Tab>",
            dismiss = "<C-]>",
          },
        },
        panel = { enabled = false },
      })

      -- ⭐ Tự enable Copilot sau khi load (rất quan trọng)
      vim.defer_fn(function()
        vim.cmd("Copilot enable")
      end, 100)
    end,
  },
  {
    "github/copilot.vim",
    enabled = true, -- Sử dụng copilot.lua thay thế
    lazy = false,
  }
}
