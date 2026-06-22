return {
  -- ====================================================================
  -- nvim-treesitter (MAIN branch — cho Neovim 0.12+)
  -- main KHÔNG hỗ trợ lazy-loading → bắt buộc lazy = false
  -- main chỉ lo CÀI parser; highlight/indent ta tự bật qua FileType autocmd
  -- ====================================================================
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      -- setup() là tùy chọn; gọi với default. Có thể truyền install_dir nếu muốn.
      require("nvim-treesitter").setup()

      local ensure_installed = {
        "lua",
        "go",
        "tsx",
        "javascript",
        "typescript",
        "python",
        "markdown",
        "markdown_inline", -- cần cho injection trong markdown (tránh lỗi cũ)
        "yaml",
        "sql",
        "json",
        "html",
        "css",
        "http",
        "java", -- THÊM: trước đây bạn chưa có parser java
        -- parser nvim hay cần sẵn:
        "vim",
        "vimdoc",
        "query",
      }

      -- Chỉ cài parser còn THIẾU (install chạy async, không block startup)
      local installed = require("nvim-treesitter.config").get_installed()
      local to_install = vim.tbl_filter(function(lang)
        return not vim.tbl_contains(installed, lang)
      end, ensure_installed)
      if #to_install > 0 then
        require("nvim-treesitter").install(to_install)
      end

      -- Bật highlight + indent theo từng filetype.
      -- pcall vì lần đầu parser có thể chưa cài xong (async) → khỏi văng lỗi.
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("nvim_treesitter_start", { clear = true }),
        callback = function()
          if pcall(vim.treesitter.start) then
            -- indent của nvim-treesitter (main) — vẫn là experimental nhưng dùng tốt
            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end,
  },

  -- ====================================================================
  -- nvim-treesitter-textobjects (MAIN branch)
  -- main: setup{} cho option, KEYMAP phải set TAY qua module functions
  -- ====================================================================
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter-textobjects").setup {
        select = {
          -- Tự nhảy tới textobject phía trước (giống targets.vim)
          lookahead = true,
        },
        move = {
          set_jumps = true, -- ghi vào jumplist
        },
      }

      local select = require "nvim-treesitter-textobjects.select"
      local move = require "nvim-treesitter-textobjects.move"
      -- local swap = require("nvim-treesitter-textobjects.swap")

      -- ---- SELECT (giữ nguyên keymap cũ của bạn) ----
      local select_maps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["al"] = "@loop.outer",
        ["il"] = "@loop.inner",
        ["ai"] = "@conditional.outer",
        ["ii"] = "@conditional.inner",
        ["aP"] = "@parameter.inner",
      }
      for key, query in pairs(select_maps) do
        vim.keymap.set({ "x", "o" }, key, function()
          select.select_textobject(query, "textobjects")
        end, { desc = "TS select " .. query })
      end

      -- ---- MOVE (giữ nguyên: [f [c = previous start, ]f ]c = next end) ----
      vim.keymap.set({ "n", "x", "o" }, "[f", function()
        move.goto_previous_start("@function.outer", "textobjects")
      end, { desc = "Prev function start" })
      vim.keymap.set({ "n", "x", "o" }, "[c", function()
        move.goto_previous_start("@class.outer", "textobjects")
      end, { desc = "Prev class start" })
      vim.keymap.set({ "n", "x", "o" }, "]f", function()
        move.goto_next_end("@function.outer", "textobjects")
      end, { desc = "Next function end" })
      vim.keymap.set({ "n", "x", "o" }, "]c", function()
        move.goto_next_end("@class.outer", "textobjects")
      end, { desc = "Next class end" })

      -- ---- SWAP (bản gốc để enable=false → để sẵn dạng comment, mở khi cần) ----
      -- vim.keymap.set("n", "<leader>a", function()
      --   swap.swap_next("@parameter.inner")
      -- end, { desc = "Swap next parameter" })
      -- vim.keymap.set("n", "<leader>A", function()
      --   swap.swap_previous("@parameter.inner")
      -- end, { desc = "Swap previous parameter" })
    end,
  },
}
