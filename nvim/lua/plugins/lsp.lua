return {
  -- Đảm bảo LSP server `gopls` và `tsserver` được cài qua Mason
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "gopls", "ts_ls", "ruff", "pyright" },
    },
  },

  -- Cấu hình LSP cho Go và TypeScript/JavaScript
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {
          settings = {
            gopls = {
              unusedparams = true,
              analyses = {
                shadow = true,
              },
              staticcheck = true,
            },
          },
        },
        ts_ls = {
          init_options = {
            plugins = {
              {
                name = "@vue/typescript-plugin",
                location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
                languages = { "javascript", "typescript", "vue" },
              },
            },
          },
          filetypes = {
            "javascript",
            "typescript",
            "vue",
          },
        },
        ruff = {
          init_options = {
            settings = {
              -- Server settings should go here
            },
          },
        },
        pyright = {},
      },
    },
  },
}
