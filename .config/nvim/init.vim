set nocompatible
set showmatch
set ignorecase
set hlsearch
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set number
set cc=120
syntax on

set spelllang=cs,en
set spell

set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
set list

call plug#begin("~/.vim/plugged")
				Plug 'scrooloose/nerdtree'
				Plug 'airblade/vim-gitgutter'
				Plug 'preservim/nerdcommenter'
				Plug 'neovim/nvim-lspconfig'
				Plug 'editorconfig/editorconfig-vim'
call plug#end()

lua << EOF
		require'lspconfig'.pyright.setup{}
EOF

nnoremap <PageUp> <PageUp>zz
nnoremap <PageDown> <PageDown>zz
nnoremap <c-PageUp> -5
nnoremap <c-PageDown> +5

nnoremap <c-n> :NERDTreeToggle<CR>

