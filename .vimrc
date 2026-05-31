" --- UI / behavior ---
set number
set relativenumber
set numberwidth=4
set signcolumn=yes
set title
set more
set laststatus=2
set statusline=%f%m%r\ [%{&filetype}]\ %=%l:%c\ %p%%
set belloff=all
set pumheight=10
set omnifunc=syntaxcomplete#Complete
set path=.,**
set showtabline=2

" --- encoding / syntax ---
set encoding=utf-8

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
set completeopt=menuone,longest,popup
set complete=.,w,b,u,t,i,k

" --- netrw ---
let g:netrw_banner=0

" --- restore cursor ---
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" --- leader ---
let mapleader=" "
let maplocalleader="\\"

nnoremap <leader>f :find<Space>
nnoremap <leader>fg :vimgrep<Space>
nnoremap <leader>fb :buffers<CR>:buffer<Space>
nnoremap <leader>h :h<Space>
nnoremap <leader>e :Explore<CR>

" --- basic mappings ---
nnoremap <leader>w :%s/\s\+$//e<CR>:write<CR>
nnoremap <leader>q :quit<CR>
nnoremap <leader>wq :xa<CR>
nnoremap <leader>n :norm<Space>
vnoremap <leader>n :norm<Space>
xnoremap <leader>n :norm<Space>
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>
nnoremap <leader>bf :bw!<CR>

vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv
nnoremap n nzzzv
nnoremap N Nzzzv

colorscheme retrobox
