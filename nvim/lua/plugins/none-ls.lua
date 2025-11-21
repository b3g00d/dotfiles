return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "jay-babu/mason-null-ls.nvim",
  },

  config = function()
    local null_ls = require "null-ls"

    -- Tự động cài golangci-lint qua Mason
    require("mason-null-ls").setup {
      ensure_installed = { "golangci-lint" },
      automatic_installation = true,
    }

    null_ls.setup {
      debug = true,
      sources = {
        null_ls.builtins.diagnostics.golangci_lint.with {
          command = "golangci-lint",
          args = function(params)
            return {
              "run",
              "--output.json.path=stdout",
              "--show-stats=false",
              "--path-mode",
              "abs",
              "--config",
              vim.fn.expand "~/.golangci.yml",
            }
          end,
          cwd = function(params)
            return params.root
          end,
        },
      },
      on_attach = function(client, bufnr)
        print("null-ls attached to " .. vim.api.nvim_buf_get_name(bufnr))
      end,
    }

    -- Thông báo để biết none-ls đang chạy
    vim.notify("[none-ls] golangci-lint linting enabled", vim.log.levels.INFO)
  end,
}
