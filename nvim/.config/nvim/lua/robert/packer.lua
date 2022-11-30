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

  -- LSP
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/vim-vsnip'

  --[[
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'nvim-lua/completion-nvim'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'L3MON4D3/LuaSnip'
  use ('tzachar/cmp-tabnine', {run = './install.sh' })
  ]]--

  -- git
  use 'TimUntersberger/neogit'

  -- Harpoon
  use 'ThePrimeagen/harpoon'

  -- Treesitter 
  use ('nvim-treesitter/nvim-treesitter', {
      run =  'TSUpdate'
  })

  -- UndoTree
  use 'mbbill/undotree'


  --[[
  -- Debugger
  use 'mfussenegger/nvim-dap'
  use 'rcarriga/nvim-dap-ui'
  use 'leoluz/nvim-dap-go'
  use 'mfussenegger/nvim-dap-python'
  use 'theHamsta/nvim-dap-virtual-text'
  ]]--

end)
