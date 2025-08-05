local settings = {
  expandtab = false,
  shiftwidth = 4,
  tabstop = 4,
  softtabstop = 4,
}

for k, v in pairs(settings) do
  vim.opt[k] = v
end
