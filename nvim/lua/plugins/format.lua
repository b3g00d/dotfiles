local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    go = { "golines", "goimports" },
    javascript = { "biome" },
    tsx = { "biome" },
    json = { "biome" },
    python = { "autopep8" },
    yaml = { "prettier" },
    sql = { "sql_formatter" },
    html = { "biome" },
    http = { "kulala" },
  },

  formatters = {
    sql_formatter = {
      command = "sql-formatter",
      args = { "-l", "mysql" },
    },
    kulala = {
      command = "kulala-fmt",
      args = { "format", "$FILENAME" },
      stdin = false,
    },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 5000,
    lsp_format = "fallback",
  },
}

return {
  "stevearc/conform.nvim",
  event = "BufWritePre", -- uncomment for format on save
  config = function()
    require("conform").setup(options)
  end,
}
