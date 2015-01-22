set tabstop=4 shiftwidth=4 expandtab smartindent
imap jk <Esc>
set number
let mapleader = ","
execute pathogen#infect()
syntax on
filetype plugin indent on
let g:airline#extensions#tabline#enabled = 1
"let g:airline_theme='badwolf'
let laststatus=2
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
"colorscheme badwolf
"let badwolf_darkgutter = 1
