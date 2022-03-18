set path+=**
set wildignore+=*/node_modules/*

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set ai "Auto indent
set si "Smart indent
set relativenumber
set nu
set nohlsearch
set hidden
set noerrorbells
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
"set noshowmode
set signcolumn=yes
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

set cmdheight=2
set updatetime=50

" more natural window split
set splitbelow
set splitright

let loaded_matchparen = 1
let mapleader = " "

let g:netrw_browse_split = 0
let g:netrw_banner = 0
let g:netrw_winsize = 25

runtime ./plug.vim
runtime ./maps.vim
lua require("ryanzplee")


if exists("&termguicolors") && exists("&winblend")
  syntax enable
  set termguicolors
  set winblend=0
  set wildoptions=pum
  set pumblend=5
  set background=dark
  let g:neosolarized_termtrans=1
  runtime ./colors/NeoSolarized.vim
  colorscheme NeoSolarized
  "colorscheme gruvbox
endif

if executable('rg')
    let g:rg_derive_root='true'
endif

augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
