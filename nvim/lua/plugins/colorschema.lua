return {
  -- add gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000, -- đảm bảo load trước LazyVim
    config = function()
      vim.o.background = "light" -- đặt chế độ sáng
      require("gruvbox").setup({
        -- Bạn có thể thêm các tùy chọn tùy chỉnh ở đây nếu muốn
      })
    end,
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
