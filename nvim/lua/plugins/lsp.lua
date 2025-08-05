local map = vim.keymap.set

return {
  "neovim/nvim-lspconfig",
  lazy = false,
  dependencies = {
    "saghen/blink.cmp",
    { "williamboman/mason.nvim", opts = {} },
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "nvim-telescope/telescope.nvim",
  },

  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc, mode)
          mode = mode or "n"
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end
        local telescope = require "telescope.builtin"

        map("gd", telescope.lsp_definitions, "Goto Definition")
        map("gD", vim.lsp.buf.declaration, "Goto Declaration")
        map("gR", telescope.lsp_references, "Goto References")
        map("gI", telescope.lsp_implementations, "Goto Implementation")
        map("<leader>q", vim.lsp.buf.code_action, "Code Action", { "n", "x" })
        map("<leader>rn", vim.lsp.buf.rename, "Rename")
      end,
    })

    vim.diagnostic.config {
      severity_sort = true,
      float = { border = "single", max_width = 80 },
      underline = true,
      focusable = true,
      virtual_text = {
        prefix = "●",
        spacing = 2,
      },
    }
    map("n", "K", vim.diagnostic.open_float, { desc = "Open Diagnostics in Float" })
    map("n", "S", function()
      local ok = pcall(vim.lsp.buf.hover, {
        border = "single",
        max_width = 80,
        focusable = false,
        silent = true,
      })
      if not ok then vim.notify("LSP hover failed", vim.log.levels.WARN) end
    end, { desc = "show documentation" })

    local servers = {
      gopls = {},

      lua_ls = {
        settings = {
          Lua = {
            runtime = {
              -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
              version = 'LuaJIT',
            },
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              checkThirdParty = false,
              library = {
                vim.env.VIMRUNTIME
                -- Depending on the usage, you might want to add additional paths
                -- here.
                -- '${3rd}/luv/library'
                -- '${3rd}/busted/library'
              }
            },
            completion = {
              callSnippet = "Replace",
            },
          },
        },
      },

      ts_ls = {},
      html = {},
      cssls = {},
      tailwindcss = {},

      pyright = {},

      jsonls = {},
    }

    local original_capabilities = vim.lsp.protocol.make_client_capabilities()
    local capabilities = require("blink.cmp").get_lsp_capabilities(original_capabilities)

    vim.lsp.buf.signature_help = function() end
    local ensure_installed = vim.tbl_keys(servers or {})
    require("mason-tool-installer").setup { ensure_installed = ensure_installed }

    require("mason-lspconfig").setup {
      ensure_installed = ensure_installed,
      automatic_installation = true,
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
          require("lspconfig")[server_name].setup(server)
        end,
      },
    }
  end,
}
