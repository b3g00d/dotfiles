return {
  -- Thêm nvim-tree.lua vào cấu hình
  {
    "nvim-tree/nvim-tree.lua",
    cmd = "NvimTreeToggle", -- Chỉ tải khi dùng lệnh NvimTreeToggle
    config = function()
      require("nvim-tree").setup({
        -- Các cấu hình tuỳ chỉnh cho NvimTree (nếu cần)
      })
    end,
  },
}
