"make it not compatible with vi
set nocompatible

"set the ruleer

"--------------------------
"表示関連
"--------------------------
set ru
set hls
set is
colorscheme caramel
"-------------------------
"seraching
"-------------------------
set history=100
set ignorecase
set noincsearch
set incsearch

set title
set number
set showmatch

syntax on
"--------------------------
"インデント
"--------------------------
set tabstop=4
set softtabstop=4
set shiftwidth=4

set autoindent
set nosmartindent
set cindent
set expandtab

set spell

"---------------------------
"国際化関係
"---------------------------
set encoding=utf-8
set fileencodings=utf-8,euc-jp,ucs-bom,euc-jp,cp932,iso-2022-jp

"--------------------------
"オートコマンド
"--------------------------
if has ("autocmd")
    filetype plugin indent on
    autocmd BufReadPost
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \ exe "normal g`\"" |
        \ endif
endif

set hidden
set shortmess+=I

"-------------------------
"split screens
"------------------------
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l

"-------------------------
"dump and others
"------------------------
nmap dp ouse Data::Dumper;<CR>warn Dumper();<Esc>h
nmap mp :<C-u>! mixi-prove <C-r>=expand('%:p')<CR><CR>

"------------------------
"plugin:search_pm
"-----------------------
noremap fg :call Search_pm('vne')<ENTER>
noremap ff :call Search_pm('e')<ENTER>
noremap fd :call Search_pm('sp')<ENTER>
noremap ft :call Search_pm('tabe')<ENTER>

"-----------------------
"plugin:PerldocやMan等をvim上で閲覧できるようになるプラグイン
"-----------------------
call pathogen#incubate()

"---------------------
"補足プラグイン
"---------------------
let g:neocomplcache_enable_at_startup = 1
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

"--------------------------
"%を押すと、<div>タグの終わりにオブプラグイン
"--------------------------
source $VIMRUNTIME/macros/matchit.vim
let b:match_words = '<:>,<div.*>:</div>'

"-------------------------
"codereview自動実行
"-------------------------
if has('autocmd')
    augroup EditPerl
    autocmd!
    autocmd BufWritePost,FileWritePost *.{t,p[lm]} !/usr/local/mixi-devtools/mixi-codereview/bin/codereview.pl <afile>
    autocmd BufWritePost,FileWritePost *.tmpl !./script/devel/template-validator <afile>
    augroup END
endif
