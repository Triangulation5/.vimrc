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
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/everforest'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'dense-analysis/ale'

let g:WebDevIconsEnableNERDTreePlugin = 1
let g:NERDTreeWinPos = "left"
let g:NERDTreeShowHidden= 1
let g:NERDTreeQuitOnOpen= 1
let g:NERDTreeWinSize = 27
let g:NERDTreeMinimalUI = 1
let g:NERDTreeMinimalMenu = 1
let g:NERDTreeChDirMode = 2
let g:NERDTreeDirArrowExpandable  = "▸"
let g:NERDTreeDirArrowCollapsible = "▾"
let g:NERDTreeIgnore = ['\.pyc$', '\~$', '^node_modules$', '^\.git$', '^dist$', '^build$']
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeWinHighlightCursorLine = 1
let g:NERDTreeStatusline = '[%f]'
let $FZF_DEFAULT_COMMAND = "rg --files --hidden --follow --glob '!.git/*' --glob '!__pycache__/*' --glob '!*.pyc' --glob '!*.pyo' --glob '!*.class' --glob '!*.o' --glob '!*.obj' --glob '!*.so' --glob '!*.dll' --glob '!*.exe' --glob '!*.log' --glob '!*.tmp' --glob '!*.swp' --glob '!*.DS_Store' --glob '!node_modules/*' --glob '!dist/*' --glob '!build/*' --glob '!.idea/*' --glob '!.vscode/*' --glob '!venv/*' --glob '!env/*' --glob '!*.egg-info/*' --glob '!coverage/*'"
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }
let g:netrw_banner = 0

call plug#end()

color everforest
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
set listchars=tab:\ \ ,trail:·
se ai
se si
set breakindent
se background=dark
se bg=dark
se tgc
se updatetime=50
se timeoutlen=150
se sidescrolloff=8
se noshowmode
se noswapfile
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
nnoremap <leader>w :%s/\s\+$//e<CR>:w<CR>
nnoremap <leader>q :quit<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>fg :Rg<CR>
nnoremap <leader>fw :Rg <C-R><C-W><CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fc :Colors<CR>
nnoremap <leader>h :Helptags<CR>
nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>
nnoremap <leader>bf :bw!<CR>
nnoremap <leader>bd :bdelete<CR>
nnoremap <leader>gg :!lazygit<CR>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap <leader>gj :GitGutterNextHunk<CR>
nnoremap <leader>gk :GitGutterPrevHunk<CR>
nnoremap <leader>gp :GitGutterPreviewHunk<CR>
nnoremap <leader>/ :Commentary<CR>
vnoremap <leader>/ :Commentary<CR>
nnoremap n nzzzv
nnoremap N Nzzzv
inoremap <C-h> <C-w>
inoremap <C-BS> <C-w>
inoremap jk <Esc>
nnoremap d "_d
vnoremap d "_d
nnoremap c "_c
vnoremap c "_c
nnoremap x "_x
nnoremap <C-p> :botright terminal powershell<CR>
nnoremap gd <Plug>(coc-definition)
nnoremap gr <Plug>(coc-references)
nnoremap gi <Plug>(coc-implementation)


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
let g:ale_fix_on_save = 1
autocmd StdinReadPre * let s:std_in=1
autocmd BufEnter * if winnr('$') == 1 && bufname() == 'NERD_tree_' . tabpagenr() | quit | endif
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
