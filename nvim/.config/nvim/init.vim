set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set nowrap
set incsearch
set scrolloff=8

set colorcolumn=80
set signcolumn=yes

syntax on

set spelllang=cs,en
set spell

set listchars=tab:>·,trail:~,extends:>,precedes:<,space:␣

call plug#begin("~/.config/nvim/plugged")
	Plug 'scrooloose/nerdtree'
    Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'gruvbox-community/gruvbox'
	Plug 'airblade/vim-gitgutter'
	Plug 'neovim/nvim-lspconfig'
    Plug 'kabouzeid/nvim-lspinstall'
    Plug 'ap/vim-css-color'
call plug#end()

colorscheme gruvbox
highlight Normal ctermbg=NONE guibg=NONE

lua << EOF
    require'lspinstall'.setup() -- important

    local servers = require'lspinstall'.installed_servers()
    for _, server in pairs(servers) do
      require'lspconfig'[server].setup{}
    end
EOF

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
nnoremap <home> <esc>$
