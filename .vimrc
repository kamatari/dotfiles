" vim setting file
set title
set ruler
set showmode
set ts=4 sw=4 sts=4
set autoindent
set encoding=euc-jp
set showmatch
set smartcase
set incsearch
set hlsearch
set t_Co=256
set expandtab
syntax on

syntax enable
set background=dark
colorscheme wombat 

autocmd WinEnter * setlocal cursorline
autocmd WinEnter * setlocal nocursorline

"set encoding=sjis
"set fileencoding=euc-jp
"set fileencoding=sjis
"set fileencodings=utf-8,cp932,iso-2022-jp,euc-jp

"you can change file encoding by type :Utf8 or :Eucjp
command! Eucjp edit ++enc=euc-jp
command! Utf8 edit ++enc=utf8
