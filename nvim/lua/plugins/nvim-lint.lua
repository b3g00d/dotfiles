-- return {
--   "nvimtools/none-ls.nvim",
--   dependencies = {
--     "williamboman/mason.nvim",
--     "jay-babu/mason-null-ls.nvim",
--   },
--
--   config = function()
--     local null_ls = require "null-ls"
--
--     -- Tự động cài golangci-lint qua Mason
--     require("mason-null-ls").setup {
--       ensure_installed = { "golangci-lint" },
--       automatic_installation = true,
--     }
--
--     null_ls.setup {
--       debug = true,
--       sources = {
--         null_ls.builtins.diagnostics.golangci_lint.with {
--           command = "golangci-lint",
--           args = function(params)
--             return {
--               "run",
--               "--output.json.path=stdout",
--               "--show-stats=false",
--               "--path-mode",
--               "abs",
--               "--config",
--               vim.fn.expand "~/.golangci.yml",
--             }
--           end,
--           cwd = function(params)
--             return params.root
--           end,
--         },
--       },
--       on_attach = function(client, bufnr)
--         print("null-ls attached to " .. vim.api.nvim_buf_get_name(bufnr))
--       end,
--     }
--
--     -- Thông báo để biết none-ls đang chạy
--     vim.notify("[none-ls] golangci-lint linting enabled", vim.log.levels.INFO)
--   end,
-- }

return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require "lint"

    lint.linters_by_ft = {
      go = { "golangcilint" },
    }

    -- Override builtin golangcilint cho golangci-lint v2
    local golangcilint = lint.linters.golangcilint
    golangcilint.append_fname = false
    golangcilint.args = {
      "run",
      "--output.json.path=stdout", -- JSON ra stdout (cú pháp v2)
      "--show-stats=false",
      "--issues-exit-code=0", -- có issue vẫn không coi là lỗi process
      "--path-mode",
      "abs", -- path tuyệt đối để map đúng buffer
      "--config",
      vim.fn.expand "~/.golangci.yml",
      function() -- chỉ lint package của file hiện tại → nhanh
        return vim.fn.expand "%:p:h"
      end,
    }

    -- Lint khi mở & khi lưu file Go
    local grp = vim.api.nvim_create_augroup("GoLint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost" }, {
      group = grp,
      pattern = "*.go",
      callback = function()
        lint.try_lint()
      end,
    })

    -- Lint thủ công
    vim.keymap.set("n", "<leader>ll", function()
      lint.try_lint()
    end, { desc = "Lint (golangci-lint)" })
  end,
}
