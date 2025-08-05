local settings = {
  shiftwidth = 2,
  tabstop = 2,
  softtabstop = 2,
}

for k, v in pairs(settings) do
  vim.opt[k] = v
end
