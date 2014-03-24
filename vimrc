set nocompatible                  " Must come first because it changes other options.

call pathogen#infect()            " Auto-load all bundles

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.
set showmatch                     " Match parens, brackets, ...

set foldenable                    " Auto fold code

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set wrap                          " Turn on line wrapping.
set textwidth=100                 " wrap lines at 100
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
"set directory=$HOME/.vim/tmp/     " Keep swap files in one location

set tabstop=2                     " Global tab width.
set shiftwidth=2                  " And again, related.
set expandtab                     " Use spaces instead of tabs

set mouse=a                       " enable mouse for all modes

set laststatus=2                  " Show the status line all the time
set statusline=%#StatusLineNC#%{GitBranchInfoString()}\ %n:%f%m\ ,,,,,%y%=,,,,%l,%c\ \ \ %P\

set autoindent                    " Auto indenting
set autoread                      " No prompt for file changes outside Vim

set splitright                    " Add new window towards the right
set splitbelow                    " ... and bottom

let g:solarized_termcolors=256
let g:solarized_termtrans=1
set background=dark
colorscheme solarized

" Remove trailing whitespaces on save
autocmd BufWritePre * :call TrimWhiteSpaces()
function TrimWhiteSpaces()
  let l=line('.')
  %s/\s\+$//e
  exe "normal! " + l
endfunction

" Display trailing whitespaces and tabs
set list listchars=tab:»·,trail:·

let mapleader = ','              " Default leader is \

" kj - The intuitive way to get out of insert mode
imap kj         <Esc>

" Indent/unindent visual mode selection
vmap <tab>      >gv
vmap <S-tab>    <gv

" Map ,e to open files in the same directory as the current file
map <leader>e :e <C-R>=expand("%:h")<cr>/

" Uncomment to use Jamis Buck's file opening plugin
"map <Leader>t :FuzzyFinderTextMate<Enter>

" CTRL+C, CTRL+V
vmap <C-c> y:call system("pbcopy", getreg("\""))<CR>
nmap <C-v> :call setreg("\"",system("pbpaste"))<CR>

" PLUGIN SETTINGS
" git-branch-info
let g:git_branch_status_head_current=1
let g:git_branch_status_text=""
let g:git_branch_status_nogit=""

"" autocomplete funcs and identifiers for languages
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" NerdTree
map \ :NERDTreeFind<CR>

" Windows
map <leader>s <C-w>s
map <leader>v <C-w>v
map <leader>h <C-w>h
map <leader>j <C-w>j
map <leader>k <C-w>k
map <leader>l <C-w>l


" Colemak
" Up/down/left/right
nnoremap n h|xnoremap n h|onoremap n h|
nnoremap e k|xnoremap e k|onoremap e k|
nnoremap n j|xnoremap n j|onoremap n j|
nnoremap i l|xnoremap i l|onoremap i l|

" kj - The intuitive way to get out of insert mode
imap en         <Esc>
