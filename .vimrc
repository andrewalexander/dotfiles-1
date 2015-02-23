set tabstop=4 shiftwidth=4 expandtab smartindent
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
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000

" Yank, Comment, and Paste
map <Leader>cz yy:call NERDComment(1, "toggle")<CR>p
