set guifont=Inconsolata:h20       " Font family and font size.
set antialias                     " MacVim: smooth fonts.
set encoding=utf-8                " Use UTF-8 everywhere.
set guioptions=e

" Tab navigation
map <D-LEFT> :tabprev<CR>
map <D-RIGHT> :tabnext<CR>
map <LEADER>f :tabnext<CR>
map <LEADER>d :tabprev<CR>

" Enable jslint, tests by default
let g:runtests_enabled = 1
let g:jslint_enabled = 1

" Split window on start
autocmd VimEnter * wincmd v

