-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Colorscheme
  use 'morhetz/gruvbox'

  use 'nvim-lua/plenary.nvim'
  use 'ThePrimeagen/harpoon'

  use ('nvim-treesitter/nvim-treesitter', {
      run =  'TSUpdate'
  })

  use 'mbbill/undotree'

  use("TimUntersberger/neogit")


end)
