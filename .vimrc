syntax on
filetype plugin on
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

command C let @/ = ""

execute pathogen#infect()

let mapleader=" "

highlight OverLength ctermbg=red ctermfg=white
match OverLength /\%79v.\+/

set cinoptions=l1

au BufRead,BufNewFile *.md set filetype=markdown
let g:vim_markdown_folding_disabled=1

" Increase the update time for GitGutters
set updatetime=250
