set tabstop=4 shiftwidth=4 expandtab
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
imap jk <Esc>
set number
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

" NERDTree
map <C-n> :NERDTreeToggle<CR>

" Persistent UNDO
if v:version >= 703
	set undofile
	set undodir=$HOME/.vim/undo
	set undolevels=1000
	set undoreload=10000
endif

" Yank, Comment, and Paste
nmap <Leader>cz yy:call NERDComment(1, "toggle")<CR>p
vmap <Leader>cz "yygv:call NERDComment(1, "toggle")<CR>`>p
