vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

-- load plugins
local lazy_config = {
  defaults = {
    lazy = true, -- load plugins lazily by default
  },
  install = {
    colorscheme = { "solarized", "habamax" },
  },
  checker = {
    enabled = true, -- auto check plugin updates
    notify = false,
  },
}

require("lazy").setup({
  { import = "plugins" },
}, lazy_config)

require "options"
require "autocmds"

vim.schedule(function()
  require "mappings"
end)

vim.o.background = "light" -- or "light" for light mode
vim.cmd [[colorscheme solarized]]
