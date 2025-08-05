-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
local opt = vim.opt
local o = vim.o
local g = vim.g

o.termguicolors = true
o.laststatus = 3
o.showmode = false

o.clipboard = "unnamedplus"
o.cursorline = true
o.cursorlineopt = "number"

-- Indenting
o.expandtab = true
o.shiftwidth = 2
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2

opt.fillchars = { eob = " " }
o.ignorecase = true
o.smartcase = true
o.mouse = "a"

-- Numbers
o.number = true
o.relativenumber = true
o.numberwidth = 2
o.ruler = false

-- spell
o.spell = true
o.spelllang = "en"

-- disable nvim intro
opt.shortmess:append "sI"

o.signcolumn = "yes"
o.splitbelow = true
o.splitright = true
-- o.timeoutlen = 0
o.undofile = true
o.wildmenu = false

-- interval for writing swap file to disk, also used by gitsigns
o.updatetime = 500

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"

-- wrap text at the end of the line
vim.wo.wrap = true
vim.wo.linebreak = true
