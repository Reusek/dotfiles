set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set relativenumber
set nu rnu
set nohlsearch
set hidden
set noerrorbells
set nowrap
set incsearch
set scrolloff=8
set mouse=a

set colorcolumn=80
set signcolumn=yes:1

syntax on

set spelllang=cs,en
set spell

set listchars=tab:>·,trail:~,extends:>,precedes:<,space:␣
set list

call plug#begin("~/.config/nvim/plugged")
	Plug 'scrooloose/nerdtree'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'gruvbox-community/gruvbox'
    Plug 'sonph/onehalf', { 'rtp': 'vim' }
    Plug 'rakr/vim-one'
    Plug 'tpope/vim-fugitive'
	Plug 'airblade/vim-gitgutter'
	Plug 'vim-airline/vim-airline'
	Plug 'ap/vim-css-color'
	Plug 'editorconfig/editorconfig-vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

colorscheme onehalfdark
hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
let g:gitgutter_set_sign_backgrounds = 1

let mapleader=" "

nnoremap <PageUp> <PageUp>zz
nnoremap <PageDown> <PageDown>zz
nnoremap <c-PageUp> -5
nnoremap <c-PageDown> +5

nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<cr>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

nnoremap <c-n> :NERDTreeToggle<CR>

nmap <leader>gs :G<CR>

