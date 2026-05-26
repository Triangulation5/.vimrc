set nocompatible

" --- UI / behavior ---
colorscheme vague
set number
set relativenumber
set numberwidth=4
set signcolumn=yes
set colorcolumn=80
set cursorline
set showmatch
set laststatus=2
set noshowmode
set title
set statusline=%f%m%r\ [%{&filetype}]\ %=%l:%c\ %p%%
set belloff=all
set completeopt=menuone,longest,popup
set complete=.,w,b,u,t,i,k
set pumheight=10
set shortmess+=c
set omnifunc=syntaxcomplete#Complete
set path=**
set showtabline=2

" --- encoding / syntax ---
set encoding=utf-8
syntax on
filetype plugin indent on

" --- tabs / indent ---
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smartindent
set breakindent

" --- search ---
set ignorecase
set smartcase
set incsearch
set hlsearch
set nohlsearch

" --- scrolling ---
set scrolloff=8
set sidescrolloff=8

" --- timing ---
set updatetime=50
set timeoutlen=150

" --- misc ---
set backspace=indent,eol,start
set list
set listchars=tab:\ \ ,trail:·
set background=dark
set termguicolors
set noswapfile
set whichwrap+=<,>,[,],h,l
set iskeyword+=-
set completeopt=menuone,noselect

" --- netrw ---
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3

" --- restore cursor ---
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" --- leader ---
let mapleader=" "
let maplocalleader="\\"

nnoremap <leader>f :find<Space>
nnoremap <leader>fg :vimgrep<Space>
nnoremap <leader>fb :buffers<CR>
nnoremap <leader>h :h<Space>
nnoremap <leader>pv :Explore<CR>
nnoremap <leader>e :25Vex<CR>

" --- basic mappings ---
nnoremap <leader>w :%s/\s\+$//e<CR>:w<CR>
nnoremap <leader>q :quit<CR>
nnoremap <leader>wq :xa<CR>

nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>
nnoremap <leader>bf :bw!<CR>
nnoremap <leader>te :tabe<Space>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap n nzzzv
nnoremap N Nzzzv
