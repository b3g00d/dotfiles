local map = vim.keymap.set

return {
  "neovim/nvim-lspconfig",
  lazy = false,
  dependencies = {
    "saghen/blink.cmp",
    { "mason-org/mason.nvim", opts = {} },
    "mason-org/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "nvim-telescope/telescope.nvim",
  },

  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
      callback = function(event)
        local bmap = function(keys, func, desc, mode)
          mode = mode or "n"
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end
        -- Có server nào support textDocument/implementation không?
        local function has_impl()
          for _, client in ipairs(vim.lsp.get_clients { bufnr = event.buf }) do
            if client.server_capabilities.implementationProvider then
              return true
            end
          end
          return false
        end
        local telescope = require "telescope.builtin"

        bmap("gd", telescope.lsp_definitions, "Goto Definition")
        bmap("gD", vim.lsp.buf.declaration, "Goto Declaration")
        bmap("gR", telescope.lsp_references, "Goto References")
        -- gI thông minh: Go/Java dùng LSP thật; Python (pyright) rơi xuống grep `def <name>`
        bmap("gI", function()
          if has_impl() then
            telescope.lsp_implementations()
          else
            local word = vim.fn.expand "<cword>"
            local ft = vim.bo[event.buf].filetype
            local search = (ft == "python") and ("def " .. word) or word
            telescope.grep_string { search = search, use_regex = false }
          end
        end, "Goto Implementation")
        bmap("<leader>q", vim.lsp.buf.code_action, "Code Action", { "n", "x" })
        bmap("<leader>rn", vim.lsp.buf.rename, "Rename")
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
      if not ok then
        vim.notify("LSP hover failed", vim.log.levels.WARN)
      end
    end, { desc = "show documentation" })

    local servers = {
      gopls = {
        settings = {
          gopls = {
            -- Ngăn gopls đảo workspace khi mở file từ project khác
            -- (experimentalWorkspaceModule đã bị gopls deprecated -> bỏ)
            expandWorkspaceToModule = false,
            buildFlags = { "-tags=test" }, -- nếu tag là test
            -- LƯU Ý: buildFlags là GLOBAL cho toàn workspace.
            -- "-tags=test" khiến gopls build mọi package dưới tag `test`,
            -- làm các file có `//go:build !test` không resolve được.
            -- Chỉ bật lại khi project thực sự cần:
            -- buildFlags = { "-tags=test" },
          },
        },
      },

      lua_ls = {
        settings = {
          Lua = {
            runtime = {
              -- LuaJIT trong trường hợp Neovim
              version = "LuaJIT",
            },
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              checkThirdParty = false,
              library = {
                vim.env.VIMRUNTIME,
              },
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
      ruff = {},
      jsonls = {},

      -- pylsp = {
      --   settings = {
      --     pylsp = {
      --       plugins = {
      --         pycodestyle = {
      --           ignore = { "W391" },
      --           maxLineLength = 100,
      --         },
      --         rope_autoimport = {
      --           enabled = true,
      --           completions = { enabled = true },
      --           code_actions = { enabled = true },
      --         },
      --         rope_completion = { enabled = true },
      --         rope_rename = { enabled = true },
      --       },
      --     },
      --   },
      -- },
    }

    local original_capabilities = vim.lsp.protocol.make_client_capabilities()
    local capabilities = require("blink.cmp").get_lsp_capabilities(original_capabilities)

    vim.lsp.buf.signature_help = function() end

    -- API mới (Neovim 0.11): vim.lsp.config thay cho require('lspconfig').setup
    -- Áp capabilities cho TẤT CẢ server qua wildcard '*'
    vim.lsp.config("*", {
      capabilities = capabilities,
    })

    -- Apply settings riêng cho từng server
    for server_name, server_opts in pairs(servers) do
      if next(server_opts) ~= nil then
        vim.lsp.config(server_name, server_opts)
      end
    end

    local ensure_installed = vim.tbl_keys(servers)
    require("mason-tool-installer").setup { ensure_installed = ensure_installed }

    -- mason-lspconfig v2: tự động vim.lsp.enable() các server đã cài
    -- (automatic_enable mặc định = true, không còn handlers/automatic_installation)
    require("mason-lspconfig").setup {
      ensure_installed = ensure_installed,
      automatic_enable = { exclude = { "jdtls" } }, -- nhường jdtls cho nvim-java
    }
  end,
}
