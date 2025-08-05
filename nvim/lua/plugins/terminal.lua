function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
end
vim.cmd "autocmd! TermOpen term://* lua set_terminal_keymaps()"

return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup {
      open_mapping = [[<c-t>]],
      size = function(term)
        if term.direction == "horizontal" then
          return 18
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
      shade_terminals = false,
      direction = "horizontal", --'vertical' | 'horizontal' | 'tab' | 'float',
      float_opts = {
        border = "solid",
        width = 160,
        height = 40,
        zindex = 1000,
        title_pos = "center",
      },
    }
  end,
}
