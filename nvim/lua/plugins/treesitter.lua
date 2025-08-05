return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
  build = ":TSUpdate",
  opts = function()
    return {
      ensure_installed = {
        "lua",
        "go",
        "tsx",
        "javascript",
        "typescript",
        "python",
        "markdown",
        "yaml",
        "sql",
        "json",
        "html",
        "css",
        "http",
      },

      highlight = {
        enable = true,
        use_languagetree = true,
      },

      indent = { enable = true },
      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["al"] = "@loop.outer",
            ["il"] = "@loop.inner",
            ["ai"] = "@conditional.outer",
            ["ii"] = "@conditional.inner",
            ["aP"] = "@parameter.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_previous_start = {
            ["[f"] = "@function.outer",
            ["[c"] = "@class.outer",
          },
          goto_next_end = {
            ["]f"] = "@function.outer",
            ["]c"] = "@class.outer",
          },
        },
        swap = {
          enable = false,
          swap_next = {
            ["<leader>a"] = "@parameter.inner",
          },
          swap_previous = {
            ["<leader>A"] = "@parameter.inner",
          },
        },
      },
    }
  end,
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
