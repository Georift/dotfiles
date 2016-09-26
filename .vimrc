set nocompatible
syntax on
filetype plugin on
filetype plugin indent on

set relativenumber " Hide line numbers
set expandtab     " replace tabs with spaces
set tabstop=4     " tab = 4 spaces
set shiftwidth=4  " indenting as spaces.
set softtabstop=4 " BS will remove 4 spaces as if it was a tab
set mouse=c       " don't listen to the mouse in gvim.

" :C will remove the last search highlighting
if !exists(':C')
    command C let @/ = ""
endif

set spell spelllang=en_au

" plugins
execute pathogen#infect()

set background=dark
colorscheme solarized

let mapleader=","

" highlight OverLength ctermbg=red ctermfg=white
" match OverLength /\%79v.\+/

set cinoptions=l1

" I hold shift for too long when pressing :w so just accept it
nmap :W :w

" Down is really the next line
nnoremap j gj
nnoremap k gk

" Some useful shortcuts
nmap <leader>t :cd ~/Code/subscription<cr>
nmap <leader>ev :tabedit $MYVIMRC<cr>
nmap <leader>es :tabedit ~/.vim/snippets/
nmap <leader>rs :call ReloadAllSnippets()

nmap <leader>sc :setlocal spell! spelllang=en_au<cr>

let g:ctrlp_custom_ignore = 'node_modules\'
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
" clear the Ctrl-P's cache
nmap <leader>cp :CtrlPClearAllCaches<cr>

if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Automatically reload my vimrc after saving vim
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" ;/ seaches upwards from cwd for tags file
exec "set tags=tags;/"

au BufRead,BufNewFile *.md set filetype=markdown
let g:vim_markdown_folding_disabled=1

" Give a shortcut key to NERD Tree
map <F2> :NERDTreeToggle<CR>

let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <C-p> :call pdv#DocumentWithSnip()<CR>
