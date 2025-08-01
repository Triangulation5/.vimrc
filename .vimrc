if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * ++once PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'sainnhe/everforest'
Plug 'flazz/vim-colorschemes'
Plug 'ayu-theme/ayu-vim'
" Plug 'neoclide/coc.nvim', { 'branch': 'release' }
" Plug 'dense-analysis/ale'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'

let g:WebDevIconsEnableNERDTreePlugin = 1
let g:NERDTreeWinPos = "right"
let g:NERDTreeWinSize = 27
let g:NERDTreeMinimalUI = 1
let g:NERDTreeChDirMode = 2
let g:NERDTreeIgnore = ['\.pyc$', '\~$', '^node_modules$', '^\.git$', '^dist$', '^build$']
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeWinHighlightCursorLine = 1
let g:NERDTreeStatusline = '[%f]'
let $FZF_DEFAULT_COMMAND = "rg --files --hidden --follow --glob '!.git/*' --glob '!__pycache__/*' --glob '!*.pyc' --glob '!*.pyo' --glob '!*.class' --glob '!*.o' --glob '!*.obj' --glob '!*.so' --glob '!*.dll' --glob '!*.exe' --glob '!*.log' --glob '!*.tmp' --glob '!*.swp' --glob '!*.DS_Store' --glob '!node_modules/*' --glob '!dist/*' --glob '!build/*' --glob '!.idea/*' --glob '!.vscode/*' --glob '!venv/*' --glob '!env/*' --glob '!*.egg-info/*' --glob '!coverage/*'"
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.7 } }
let g:gruvbox_contrast_dark = 'hard'

call plug#end()

colorscheme everforest
set number
set relativenumber
set numberwidth=4
set signcolumn=yes
syntax on
set encoding=utf-8
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
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
set nohlsearch
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
set completeopt=menuone,noselect
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
let mapleader = " "
let maplocalleader = "\\"
nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-p> :Files<CR>
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fg :Rg<CR>
nnoremap <leader>fw :Rg <C-R><C-W><CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fh :Helptags<CR>
nnoremap <leader>fr :History<CR>
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
nnoremap <leader>gj :GitGutterNextHunk<CR>
nnoremap <leader>gg :!lazygit<CR>
nnoremap <leader>gk :GitGutterPrevHunk<CR>
nnoremap <leader>gp :GitGutterPreviewHunk<CR>
nnoremap <leader>/ :Commentary<CR>
vnoremap <leader>/ :Commentary<CR>
nnoremap n nzzzv
nnoremap N Nzzzv
inoremap <C-h> <C-w>
inoremap <C-BS> <C-w>
nnoremap <leader>w :w<cr>
inoremap <C-h> <C-w>
inoremap jj <Esc>
inoremap jk <Esc>

function! s:ChooseTheme()
  let themes = split(globpath(&rtp, 'colors/*.vim'), '\n')
  let themes = map(themes, {_, val -> fnamemodify(val, ':t:r')})
  call fzf#run(fzf#wrap({
        \ 'source': themes,
        \ 'sink': function('s:ApplyTheme'),
        \ 'prompt': 'Theme> ',
        \ 'window': { 'width': 0.5, 'height': 0.3 } }))
endfunction

function! s:ApplyTheme(theme)
  execute 'colorscheme' a:theme
endfunction

nnoremap <leader>tt :call <SID>ChooseTheme()<CR>
augroup AirlineColors
    autocmd!
    autocmd ColorScheme gruvbox let g:airline_theme = 'gruvbox'
    autocmd ColorScheme onedark let g:airline_theme = 'onedark'
    autocmd ColorScheme catppuccin let g:airline_theme = 'default'
    autocmd ColorScheme everforest let g:airline_theme = 'forest'
augroup END

let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline_section_b = '%{&filetype}'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
