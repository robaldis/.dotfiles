set exrc
syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set relativenumber
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=10
au VimEnter * RainbowParenthesesToggle

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')
" LSP (autocompletion) ...
Plug 'morhetz/gruvbox'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'nvim-lua/completion-nvim'


" Telescope requirements ...
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'tpope/vim-fugitive'
Plug 'kien/rainbow_parentheses.vim'

" Notes
Plug 'vimwiki/vimwiki'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

" jupyter notebooks
Plug 'goerz/jupytext.vim'

Plug 'ThePrimeagen/vim-be-good'
Plug 'ThePrimeagen/harpoon'

call plug#end()


let g:gruvbox_constrast_dark = 'hard'
set termguicolors
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

let g:gruvbox_invert_selection='0'
colorscheme gruvbox
set background=dark

" Vimwiki setup
let g:vimwiki_list = [{'path': '~/ownCloud/University/', 
\ 'syntax': 'markdown', 
\ 'ext': '.md',
\ 'name': 'University'}, 
\ {'path': '~/ownCloud/Brain', 
\ 'syntax': 'markdown',
\ 'ext': '.md',
\ 'name': 'Brain'}]



" if (executable('rg'))
"     let g:rg_derive_root='true'
" endif

let mapleader = " "

nnoremap <leader>+ :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>


nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>u :UndotreeShow<CR>
" Copy to clipboard
" set clipboard+=unnamedplus
vnoremap <leader>y "+y



nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep for > ")})<CR>
nnoremap <leader>pf :lua require('telescope.builtin').find_files()<CR>


nnoremap <leader>g :Git<CR>
nnoremap <leader>gs :Git status<CR>
nnoremap <leader>gc :Git commit -m "
nnoremap <leader>ga :Git add .<CR>
nnoremap <leader>gp :Git push<CR>

" LSP remaps
noremap <leader>vd :lua vim.lsp.buf.definition()<CR>
noremap <leader>vi :lua vim.lsp.buf.implementation()<CR>
noremap <leader>vr :lua vim.lsp.buf.references()<CR>
noremap <leader>vrn :lua vim.lsp.buf.rename()<CR>
noremap <leader>vh :lua vim.lsp.buf.hover()<CR>

set completeopt=menu,menuone,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']                           

" LSP setup
lua <<EOF
local lsp_installer = require("nvim-lsp-installer")

-- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
-- or if the server is already installed).
lsp_installer.on_server_ready(function(server)
    local opts = {highlight_hovers_item = true, 
    show_guides = true}

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    -- This setup() function will take the provided server configuration and decorate it with the necessary properties
    -- before passing it onwards to lspconfig.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)
EOF
                                                                                                    

nnoremap <leader>a :lua require("harpoon.mark").add_file()<CR>
nnoremap <C-e> :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <C-h> :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <C-j> :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <C-k> :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <C-l> :lua require("harpoon.ui").nav_file(4)<CR>
nnoremap <C-g> :lua require("harpoon.mark").rm_file()<CR>
nnoremap <leader><C-r> :lua require("harpoon.mark").clear_all()<CR>

 nnoremap <leader>tj :lua require("harpoon.term").gotoTerminal(1)<CR>
 nnoremap <leader>tk :lua require("harpoon.term").gotoTerminal(2)<CR>
" not sure what command it will send
 nnoremap <leader>cj :lua require("harpoon.term").sendCommand(1, 1)<CR>
nnoremap <leader>ck :lua require("harpoon.term").sendCommand(1, 2)<CR>
