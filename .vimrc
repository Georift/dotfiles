set nocompatible
syntax on
filetype plugin on
filetype plugin indent on

set ruler          " show current cursor pos at the bottom right
set relativenumber " Hide line numbers
set expandtab      " replace tabs with spaces
set tabstop=4      " tab = 4 spaces
set shiftwidth=4   " indenting as spaces.
set softtabstop=4  " BS will remove 4 spaces as if it was a tab
set mouse=c        " don't listen to the mouse in gvim.
set ignorecase
set smartcase      " only be case sensitive if upper case is included in search
set hidden         " hide buffers when leaving instead of closing
set nowrap         " pager for mysql

:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar

:set guifont=Ubuntu_Mono:h14:cANSI:qDRAFT

set backspace=indent,eol,start

" :C will remove the last search highlighting
if !exists(':C')
    command C let @/ = ""
endif

set spell spelllang=en_au

" plugins
execute pathogen#infect()

set background=dark
let g:solarized_italic=0
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
nmap <leader>m :cd Z:\asic_msic_form<cr>
nmap <leader>v :cd Z:\veritascheck<cr>
nmap <leader>w :cd Z:\web-app-skeleton<cr>
nmap <leader>c :cd Z:\company_account<cr>
nmap <leader>ev :e $MYVIMRC<cr>
nmap <leader>es :e ~/.vim/snippets/
nmap <leader>rs :call ReloadAllSnippets()

" Switching between Angular component typescript/html files
nmap <leader>ts :e %:r.ts<cr>
nmap <leader>ht :e %:r.html<cr>

" Edit specific model within company accounts
nmap <leader>em :e backend/app/Models/

nmap <leader>hs :set hlsearch!<cr>
nmap <leader>sc :setlocal spell! spelllang=en_au<cr>

let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|public$|log\|tmp$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }

let g:ctrlp_clear_cache_on_exit = 0

" clear the Ctrl-P's cache
nmap <leader>cp :CtrlPClearAllCaches<cr>
nmap <leader>. :CtrlPTag<cr>

nnoremap gb :ls<CR>:b<Space>

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
" nnoremap <C-p> :call pdv#DocumentWithSnip()<CR>
