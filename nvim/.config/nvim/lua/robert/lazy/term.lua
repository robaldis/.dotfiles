return {
  -- amongst your other plugins
 'akinsho/toggleterm.nvim',
  version = "*",
  config = true,
  keys = {
    {'<leader>gt', '<cmd>ToggleTermToggleAll<CR>', desc='[G]oto [T]erminals'},

    {'<leader>fs', '<C-w>o', desc='[F]ull [S]creen'},

    --{'<C-c><C-c>', '<C-\\><C-n>'},
    --{'<Esc><Esc>', '<C-\\><C-n>'}
  }
}
