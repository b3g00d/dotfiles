local actions = require "telescope.actions"

local options = {
  defaults = {
    file_ignore_patterns = {
      -- "venv/",
      -- "\\.venv/",
      -- "env/",
      -- "\\.env/",
      -- "__pycache__/",
    },
    prompt_prefix = "   ",
    selection_caret = "  ",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    results_title = "",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        width = { padding = 0 },
        height = { padding = 0 },
        preview_width = 0.5,
      },
      vertical = {
        prompt_position = "top",
      },
    },
    mappings = {
      i = {
        ["<C-j>"] = actions.cycle_history_next,
        ["<C-k>"] = actions.cycle_history_prev,
      },
    },
  },
  pickers = {
    buffers = {
      mappings = {
        n = {
          ["d"] = actions.delete_buffer,
        },
      },
    },

    oldfiles = {
      theme = "dropdown",
      previewer = false,
    },
  },

  extensions_list = { "aerial", "fzf", "media_files", "ui-select", "file_browser", "live_grep_args", "frecency" },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
    media_files = {
      filetypes = { "png", "webp", "jpg", "jpeg" },
      find_cmd = "rg",
    },
    file_browser = {
      theme = "dropdown",
      previewer = false,
      hijack_netrw = false,
    },
    live_grep_args = {
      auto_quoting = true, -- enable/disable auto-quoting
    },
  },
}

return {
  "nvim-telescope/telescope.nvim",
  lazy = false,
  dependencies = {
    "stevearc/aerial.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope-ui-select.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-tree/nvim-web-devicons",
    {
      "nvim-telescope/telescope-live-grep-args.nvim",
      version = "^1.0.0",
    },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-lua/popup.nvim", "nvim-telescope/telescope-media-files.nvim" },
    {
      "nvim-telescope/telescope-frecency.nvim",
      version = "*",
    },
  },
  cmd = "Telescope",
  config = function()
    require("aerial").setup {
      icons = {
        Method = "󰆧",
        Function = "󰆧",
      },
    }

    -- load extensions
    local telescope = require "telescope"
    telescope.setup(options)
    for _, ext in ipairs(options.extensions_list) do
      telescope.load_extension(ext)
    end
  end,
}
