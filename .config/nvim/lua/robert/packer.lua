-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Colorscheme
  use 'morhetz/gruvbox'

 
  -- Telescope
  use('nvim-lua/popup.nvim')
  use 'nvim-lua/plenary.nvim'
  use('nvim-telescope/telescope.nvim', {tag = '0.1.0'})
  -- use('nvim-telescope/telescope-fzy-native.nvim')

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'nvim-lua/completion-nvim'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'L3MON4D3/LuaSnip'
  use ('tzachar/cmp-tabnine', { run = './install.sh' })

  use 'ThePrimeagen/harpoon'
  use ('nvim-treesitter/nvim-treesitter', {
      run =  'TSUpdate'
  })
  use 'mbbill/undotree'
  use("TimUntersberger/neogit")
  

end)
