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
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set helplang=ja
syntax on

"shortening input for php error_log
:inorea error error_log(' ' . var_export(, true));

"delete highlight of search word by esc x2
:nnoremap <ESC><ESC> :nohlsearch<CR>

syntax enable
set background=dark

"highlight zenkaku
scriptencoding utf-8
augroup highlightIdeographicSpace
  autocmd!
  autocmd ColorScheme * highlight IdeographicSpace term=underline ctermbg=DarkGreen guibg=DarkGreen
  autocmd VimEnter,WinEnter * match IdeographicSpace /¡¡/
augroup END
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

"color statusline insertmode & normalmode
au InsertEnter * hi StatusLine guifg=DarkBlue guibg=DarkYellow gui=none ctermfg=Blue ctermbg=Yellow cterm=none
au Insertleave * hi StatusLine guifg=DarkBlue guibg=DarkGray gui=none ctermfg=Blue ctermbg=DarkGray cterm=none
