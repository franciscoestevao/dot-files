scriptencoding utf8
set encoding=utf8
set ff=unix

set nocompatible
set wildmenu

"enable line numbers
set number
if version >= 703
    set relativenumber
endif

"enable current line and column
set cursorline
" Version 7.01 doesn't have colorcolumn
if version >= 702
    "set cursorcolumn
    set colorcolumn=80
endif

"search
set hlsearch

"enable cursor position in bottom right corner
set ruler

"show opening bracket right after closing
set showmatch

"show current command
set showcmd

set autowrite
set nowrap

"set tabs with 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab
"set smarttab
set autoindent
"set smartindent

" set mouse=a

" turn off autoindent when pasting
set pastetoggle=<F3>

"enable backspace during insert
set backspace=indent,eol,start

" enable loading indent file for filetype
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""
"theme

syntax enable
set background=dark
" If you use a terminal emulator with a transparent background and Solarized isn't displaying the background color transparently
let g:solarized_termtrans = 1
"let g:solarized_visibility = "high"
"let g:solarized_contrast = "high"
colorscheme solarized

"enable whitespace as characters
set list
"set listchars=eol:¬,tab:>·,trail:·,extends:>,precedes:<
"set listchars=tab:│·,trail:·,extends:→
"set listchars=tab:\│\ 
set listchars=tab:\│\ ,extends:›,precedes:‹,trail:·,eol:¬,nbsp:␣
"hi SpecialKey ctermfg=60 ctermbg=NONE cterm=NONE guifg=#586e75 guibg=NONE gui=italic
"highlight NonText guifg=#4a4a59
"highlight SpecialKey guifg=white guibg=#cc0000

if has("gui_running")
 " GUI is running or is about to start.
 " Maximize gvim window (for an alternative on Windows, see simalt below).
  set lines=999 columns=999
endif

""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug

" Automatic installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/bundle')

""""""" NERDTree
Plug 'scrooloose/nerdtree'
" NERDTree shows hidden files
let NERDTreeShowHidden=1
" map Ctrl+N to open NERDTree
map <C-n> :NERDTreeToggle<CR>
" start NERDTree automatically when vim starts up
autocmd vimenter * NERDTree
" Go to previous (last accessed) window (main file)
autocmd VimEnter * wincmd p
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Auto-open NERDTree in every tab
autocmd BufWinEnter * NERDTreeMirror


""""""" vim-minimap
Plug 'severin-lemaignan/vim-minimap'
let g:minimap_highlight='Visual'


" Initialize plugin system
call plug#end()


