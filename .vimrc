" vim setting file of kamatari
set title
set ruler
set showmode
set ts=2 sw=2 sts=0
set autoindent
set encoding=utf-8
set showmatch
set smartcase
set incsearch
set hlsearch
set t_Co=256
set expandtab
syntax enable
set background=dark

"status line
set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
"color statusline insertmode & normalmode
au InsertEnter * hi StatusLine guifg=DarkBlue guibg=DarkYellow gui=none ctermfg=Blue ctermbg=Yellow cterm=none
au Insertleave * hi StatusLine guifg=DarkBlue guibg=White gui=none ctermfg=Black ctermbg=White cterm=none

":help >> japanese
set helplang=ja

"shortening input for php error_log
:inorea error error_log(' ' . var_export(, true))

"delete highlight of search word by esc x2
:nnoremap <ESC><ESC> :nohlsearch<CR>

"highlight EOLspace
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
autocmd WinEnter * match WhitespaceEOL /\s\+$/

"highlight zenkaku
scriptencoding utf-8
augroup highlightIdeographicSpace
  autocmd!
  autocmd ColorScheme * highlight IdeographicSpace term=underline ctermbg=DarkGreen guibg=DarkGreen
  autocmd VimEnter,WinEnter * match IdeographicSpace /��/
augroup END
colorscheme wombat

autocmd WinEnter * setlocal cursorline
autocmd WinEnter * setlocal nocursorline

"set encoding=sjis
"set fileencoding=euc-jp
"set fileencoding=sjis
"set fileencodings=utf-8,cp932,iso-2022-jp,euc-jp

"change file encoding by type :Utf8 or :Eucjp
command! Eucjp edit ++enc=euc-jp
command! Utf8 edit ++enc=utf8

"enable neocomplcache https://github.com/Shougo/neocomplcache
"$cp -r neocomplcache/plugin/ .vim/plugin $cp -r neocomplcache/autoload/ .vim/autoload
let g:neocomplcache_enable_at_startup = 1
