-- lua/plugins/markdown-preview.lua
return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
    -- không tự mở khi vào file, chỉ mở khi gọi lệnh
    vim.g.mkdp_auto_start = 0
    vim.g.mkdp_auto_close = 1
    -- theme khớp preview với chế độ dark/light hệ thống
    vim.g.mkdp_theme = "dark"
    -- browser mặc định, có thể đổi thành "firefox" nếu bạn không dùng Chrome
    vim.g.mkdp_browser = ""
  end,
  keys = {
    { "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown Preview", ft = "markdown" },
  },
}
