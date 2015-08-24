set tabstop=4 shiftwidth=4 expandtab backspace=2
imap jk <Esc>

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
 
" Swap between buffers
nnoremap <C-g> :bnext<cr>
nnoremap <C-f> :bprev<cr>
 
set splitbelow
set splitright
set number
set encoding=utf-8
set hlsearch  " #
set incsearch " highlight search stuff
let mapleader = ","
set directory=$HOME/.vim/swap/
 
" pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on
 
" AirLine
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='badwolf'
let laststatus=2
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
colorscheme badwolf
let badwolf_darkgutter = 1

" Shift tab for command mode and insert mode
nmap <S-Tab> <<
imap <S-Tab> <Esc><<i

" Reselect last visual selected lines
nnoremap <silent> <leader>v gv
vnoremap <silent> <leader>v <S-v>

let g:NERDShutUp=1

" NERDTree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']

" Persistent UNDO
if v:version >= 703
        set undofile
        set undodir=$HOME/.vim/undo
        set undolevels=1000
        set undoreload=10000
endif

" Yank, Comment, and Paste
nnoremap <silent> <Leader>cz yy:call NERDComment(1, "toggle")<CR>p
vnoremap <silent> <Leader>cz "yygv:call NERDComment(1, "toggle")<CR>`>p

let g:netrw_list_hide= '.*\.swp$,.*\.pyc$'

" Edit vimrc in split
nnoremap <Leader>ev <C-w><C-v><C-l>:e $MYVIMRC<CR>

" riotjs Syntax Highlighting
autocmd BufRead,BufNewFile *.tag :set filetype=html

" Identation
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

" Redraw screen to remove highlighting
nnoremap <silent> <CR> :nohl<CR><CR>

" Added because of weird error with --more-- and vim-go on exit
" Might remove because I think it is vim not finding gofmt
let go_fmt_fail_silently = 1

" Always jump to last cursor position
autocmd BufReadPost *
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\   exe "normal! g'\"" |
\ endif

nnoremap <F9> :Dispatch make install<CR>
