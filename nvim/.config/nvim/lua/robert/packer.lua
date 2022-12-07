-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Colorscheme
  use 'morhetz/gruvbox'
  use('ryanoasis/vim-devicons')
 
  -- Telescope
  use('nvim-lua/popup.nvim')
  use 'nvim-lua/plenary.nvim'
  use('nvim-telescope/telescope.nvim', {tag = '0.1.0'})

  -- LSP
  use('williamboman/mason.nvim')
  use('williamboman/mason-lspconfig.nvim')
  use('neovim/nvim-lspconfig')
  use('hrsh7th/cmp-nvim-lsp')
  use('hrsh7th/nvim-cmp')
  use('hrsh7th/vim-vsnip')

  -- lualine
  use('nvim-lualine/lualine.nvim')

  -- git
  use('tpope/vim-fugitive')
  use('lewis6991/gitsigns.nvim')

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
