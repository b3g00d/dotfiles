local autocmd = vim.api.nvim_create_autocmd
autocmd("BufWinLeave", {
  pattern = "*",
  command = "silent! mkview",
})

autocmd("BufWinEnter", {
  pattern = "*",
  command = "silent! loadview",
})

autocmd("TermOpen", {
  pattern = "*",
  command = "setlocal nonumber norelativenumber cursorline nospell",
})

autocmd("FileType", {
  pattern = "qf",
  command = "setlocal nospell",
})

vim.filetype.add {
  extension = {
    ["http"] = "http",
  },
}
