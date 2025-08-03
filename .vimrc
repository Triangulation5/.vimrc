if empty(glob(expand('~/.vim/autoload/plug.vim')))
  silent execute '!curl -fLo ' . expand('~/.vim/autoload/plug.vim') . ' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * ++once call s:PlugInstall()
endif

function! s:PlugInstall()
  call plug#begin('~/.vim/plugged')
  call plug#end()
  PlugInstall | q
endfunction

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'kana/vim-textobj-user'
Plug 'glts/vim-textobj-comment'
Plug 'ludovicchabant/vim-gutentags'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/tagbar'
Plug 'wellle/targets.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ctrlpvim/ctrlp.vim'
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
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'honza/vim-snippets'
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
let g:tagbar_width = 30
let g:gutentags_modules = ['ctags']
let g:gutentags_generate_on_write = 1
let g:gutentags_ctags_tagfile = '.tags'
let g:ctrlp_custom_ignore = {
\ 'dir':  '\v[\/]\.(git|hg|svn)$',
\ 'file': '\v\.(exe|so|dll)$',
\}
let g:ctrlp_working_path_mode = 'ra'

call plug#end()

color spacegray
se nu
se rnu
se numberwidth=4
se signcolumn=yes
syntax on
se encoding=utf-8
se ts=4
se sw=4
se et
se sts=4
se so=8
se ic
se scs
filetype plugin indent on
se cul
se sm
se ls=2
se bs=indent,eol,start
se is
se hls
se nohls
se list
se lcs=tab:▸\ ,trail:·
se ai
se si
se breakindent
se tgc
se t_Co=256
se bg=dark
se updatetime=50
se timeoutlen=150
se sidescrolloff=8
se noshowmode
se title
se whichwrap+=<,>,[,],h,l
se iskeyword+=-
se completeopt=menuone,noselect
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
nnoremap <silent> K :call CocActionAsync('doHover')<CR>
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gr <Plug>(coc-references)
nnoremap <leader>rn <Plug>(coc-rename)
nnoremap <leader>ga <Plug>(coc-codeaction)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<CR>"
nnoremap <leader>tb :TagbarToggle<CR>
nnoremap <leader>p :CtrlP<CR>
nnoremap <leader>pf :CtrlP .<CR>
nnoremap <leader>pb :CtrlPBuffer<CR>
nnoremap <leader>pm :CtrlPMRUFiles<CR>
nnoremap <leader>gt :GutentagsToggleEnabled<CR>
nnoremap <leader>gT :!ctags -R .<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
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
inoremap jj <Esc>
inoremap jk <Esc>

function! s:ChooseTheme()
  let themes = split(globpath(&rtp, 'colors/*.vim'), '\n')
  let themes = map(themes, {_, val -> fnamemodify(val, ':t:r')})
  call fzf#run(fzf#wrap({
        \ 'source': themes,
        \ 'sink': function('s:ApplyTheme'),
        \ 'prompt': 'Theme> ',
        \ 'window': { 'width': 0.6, 'height': 0.4 } }))
endfunction

function! s:ApplyTheme(theme)
  execute 'color' a:theme
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
