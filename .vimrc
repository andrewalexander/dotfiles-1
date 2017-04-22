" ==================== Plugins ==================== SECTION

call plug#begin('~/.vim/plugged')

Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries'}
Plug 'farmergreg/vim-lastplace'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Currently evaluating
Plug 'Raimondi/delimitMate'
Plug 'kien/ctrlp.vim'
Plug 'derekwyatt/vim-fswitch'

call plug#end()

" ==================== Plugins: Settings ==================== SECTION
" ==================== AirLine ====================
" XXX: not sure if all this is necessary, havent looked at it in quite a while
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='badwolf'
set laststatus=2
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
colorscheme molokai_dark
let g:rehash256 = 1
set background=dark
" ==================== NerdTree ====================
let NERDTreeShowHidden=1
let g:NERDShutUp = 1
let NERDTreeIgnore = ['\.pyc$', '\.so$', '__pycache__$']
"noremap <Leader>n :NERDTreeToggle<cr>
map <C-n> :NERDTreeToggle<CR>
noremap <Leader>f :NERDTreeFind<cr>
" ==================== fswitch ====================
autocmd! BufEnter *.cc let b:fswitchdst = 'h,hpp'
nnoremap <Leader>h :call FSwitch('%', '')<CR>
" ==================== vim-go ====================
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"
let g:go_auto_type_info = 0
let g:go_echo_command_info= 0
let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 0
let g:go_highlight_build_constraints = 1
augroup go
  autocmd!
  autocmd FileType go nmap <silent> <Leader>v <Plug>(go-def-vertical)
  autocmd FileType go nmap <silent> <Leader>s <Plug>(go-def-split)
  autocmd FileType go nmap <silent> <Leader>i <Plug>(go-info)
  autocmd FileType go nmap <silent> <Leader>l <Plug>(go-metalinter)
  autocmd FileType go nmap <silent> <leader>b :<C-u>call <SID>build_go_files()<CR>
  autocmd FileType go nmap <silent> <leader>t  <Plug>(go-test)
  autocmd FileType go nmap <silent> <leader>r  <Plug>(go-run)
  autocmd FileType go nmap <silent> <leader>e  <Plug>(go-install)
  autocmd FileType go nmap <silent> <Leader>d <Plug>(go-doc)
  autocmd FileType go nmap <silent> <Leader>c <Plug>(go-coverage-toggle)
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
augroup END
" ==================== delimitMate ====================
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_smart_quotes = 1
let g:delimitMate_expand_inside_quotes = 0
let g:delimitMate_smart_matchpairs = '^\%(\w\|\$\)'
imap <expr> <CR> pumvisible() ? "\<c-y>" : "<Plug>delimitMateCR"
" ==================== Vimux ====================

map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>

" ==================== Settings ==================== SECTION
if !has('nvim')
  set nocompatible
  syntax enable
  set t_Co=256
  filetype off
  filetype plugin indent on

  set ttyfast
  set ttymouse=xterm2
  set ttyscroll=3

  set laststatus=2
  set encoding=utf-8              " Set default encoding to UTF-8
  set autoread                    " Automatically reread changed files without asking me anything
  set autoindent
  set backspace=indent,eol,start  " Makes backspace key more powerful.
  set incsearch                   " Shows the match while typing
  set hlsearch                    " Highlight found searches
  set mouse=a
endif

if has('persistent_undo')
  set undofile
  set undodir=$HOME/.vim/undo
  set undolevels=1000
  set undoreload=10000
endif

if !empty(glob("$HOME/.vimrc.local"))
    source $HOME/.vimrc.local
endif
set directory=$HOME/.vim/swap/

set noerrorbells             " No beeps
set number                   " Show line numbers
set showcmd                  " Show me what I'm typing
set nobackup                 " Don't create annoying backup files
set splitright               " Split vertical windows right to the current windows
set splitbelow               " Split horizontal windows below to the current windows
set autowrite                " Automatically save before :next, :make etc.
set hidden
set fileformats=unix,dos,mac " Prefer Unix over Windows over OS 9 formats
set noshowmatch              " Do not show matching brackets by flickering
set noshowmode               " We show the mode with airline or lightline
set ignorecase               " Search case insensitive...
set smartcase                " ... but not it begins with upper case
set completeopt=menu,menuone
set nocursorcolumn           " speed up syntax highlighting
set nocursorline
set updatetime=400
set pumheight=10             " Completion window max size
set lazyredraw               " Wait to redraw
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=expr
set foldexpr=RFoldexpr(v:lnum)
function! RFoldexpr(lnum)
  if getline(a:lnum) =~ '^\("\|#\)\+\s\+=========.* SECTION$'
	" Start a new level-one fold
	return '>1'
  else
	" Use the same foldlevel as the previous line
	return '='
  endif
endfunction

" ==================== Mappings ==================== SECTION

let mapleader = ","

" Exit insert mode
imap jk <Esc>

" XXX: might want to use movement repeat, and this prevents that
" Easier menu access
nnoremap ; :

" Standard Movement
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
 
" Start/End Line Movement
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L $
 
" Move up and down on the same line when wraps
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Source (reload configuration)
nnoremap <silent> <F5> :source $MYVIMRC<CR>

" Edit vimrc in split
nnoremap <Leader>ev <C-w><C-v><C-l>:e $MYVIMRC<CR>
 
" Swap between buffers
nnoremap <C-g> :bnext<cr>
nnoremap <C-f> :bprev<cr>

" Redraw screen to remove highlighting
nnoremap <silent> <CR> :nohl<CR><CR>

" Split line
nnoremap S i<Enter><Esc>^

" Toggle fold
nnoremap <space> za

" Reselect last visual selected lines (includes yank/paste)
nnoremap <silent> <leader>v `[v`]
vnoremap <silent> <leader>v v

" <3 Yank, Comment, and Paste <3
nnoremap <silent> <Leader>cz yy:call NERDComment(1, "toggle")<CR>p
vnoremap <silent> <Leader>cz "yygv:call NERDComment(1, "toggle")<CR>`>p

" Close buffer and retain split
nmap <silent> <leader>d :bp\|bd #<CR>

" TODO: replace with snips
nnoremap <Leader>py i#!/usr/bin/env python<CR># -*- coding: utf-8 -*-<CR><CR><ESC>

" ==================== Visual ==================== SECTION
autocmd BufRead,BufNewFile *.tag :set filetype=html
autocmd BufRead,BufNewFile *.vs :set filetype=c
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" ==================== Misc ==================== SECTION
