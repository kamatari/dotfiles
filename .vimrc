" vim setting file of kamatari
set title
set ruler
set showmode
set ts=4 sw=4 sts=4
set autoindent
set encoding=utf-8
set showmatch
set matchtime=1
set smartcase
set incsearch
set hlsearch
set t_Co=256
set expandtab
syntax enable
set background=dark

colorscheme molokai

"status line
set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
"color statusline insertmode & normalmode
au InsertEnter * hi StatusLine guifg=DarkBlue guibg=DarkYellow gui=none ctermfg=Blue ctermbg=Yellow cterm=none
au Insertleave * hi StatusLine guifg=DarkBlue guibg=White gui=none ctermfg=Black ctermbg=White cterm=none

"括弧を閉じた時に括弧の中へカーソルを移動
"imap {} {}<Left>
"imap [] []<Left>
"imap () ()<Left>
"imap "" ""<Left>
"imap '' ''<Left>
"imap <> <><Left>

":help >> japanese
set helplang=ja

"ノーマルモードの時に:と;を入れ替える (USキーボード用)
nnoremap ; :
nnoremap : ;

"shortening input for php error_log
:inorea error error_log(' ' . var_export(, true))

"delete highlight of search word by esc x2
:nnoremap <ESC><ESC> :nohlsearch<CR>

"highlight EOLspace
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

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
