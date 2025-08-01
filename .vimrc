if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \ | PlugInstall --sync | source $MYVIMRC
\ | endif
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
call plug#end()
colorscheme gruvbox
set number
set relativenumber
syntax on
set tabstop=4
set shiftwidth=4
set expandtab
set scrolloff=8
set ignorecase
set smartcase
filetype plugin indent on
set cursorline
set showmatch
set laststatus=2
set backspace=indent,eol,start
set incsearch
set hlsearch
set list
set listchars=tab:▸\ ,trail:·
set autoindent
set smartindent
set breakindent
set completeopt=menuone,noselect
set termguicolors
set background=dark
set updatetime=50
set timeoutlen=150
set sidescrolloff=8
set noshowmode
set title
set whichwrap+=<,>,[,],h,l
set iskeyword+=-
set clipboard=unnamedplus
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
let mapleader = " "
let maplocalleader = "\\
"
nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-p> :Files<CR>
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fg :Rg<CR>
nnoremap <leader>fw :Rg <C-R><C-W><CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fh :Helptags<CR>
nnoremap <leader>fr :History<CR>
nnoremap d "_d
nnoremap D "_D
vnoremap d "_d
nnoremap x "_x
nnoremap X "_X
vnoremap x "_x
vnoremap X "_X
nnoremap c "_c
nnoremap C "_C
vnoremap c "_c
nnoremap <leader>bn :bnext<cr>
nnoremap <leader>bp :bprev<cr>
nnoremap <leader>bd :bdelete<cr>
nnoremap <leader>bD :%bdelete\|edit #\|bdelete #<cr>
nnoremap <leader>ww <C-w>p
nnoremap <leader>wd <C-w>c
nnoremap <leader>w- <C-w>s
nnoremap <leader>w\| <C-w>v
nnoremap <leader>w= <C-w>=
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <leader>w :w<cr>
inoremap <C-h> <C-w>
inoremap jj <Esc>
inoremap jk <Esc>
