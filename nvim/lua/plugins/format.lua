local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    go = { "golangci-lint" },
    javascript = { "biome" },
    tsx = { "biome" },
    json = { "biome" },
    python = { "isort", "black" },
    yaml = { "prettier" },
    sql = { "sql_formatter" },
    html = { "biome" },
    java = { "google-java-format" },
  },

  formatters = {
    ["golangci-lint"] = {
      -- Dùng config global (formatters: goimports, golines)
      args = { "fmt", "--stdin", "--config", vim.fn.expand "~/.golangci.yml" },
    },
    sql_formatter = {
      command = "sql-formatter",
      args = { "-l", "mysql" },
    },
    black = {
      command = "black",
      prepend_args = { "--line-length", "79" },
      stdin = true,
    },
    google_java_format = {
      prepend_args = { "--aosp" },
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
