" Vim with all enhancements----VIM
"          _____             _____   ____   _____  
"         |  __ \     /\    / ____| / __ \ |  __ \ 
"         | |__) |   /  \  | |  __ | |  | || |__) |
"         |  _  /   / /\ \ | | |_ || |  | ||  _  / 
"         | | \ \  / ____ \| |__| || |__| || | \ \ 
"         |_|  \_\/_/    \_\\_____| \____/ |_|  \_\
"

" ---------------------------GENERAL---------------------
" Lang & Encoding {{{
set fileencodings=utf-8,gbk2312,gbk,gb18030,cp936
set fileformat=unix
set encoding=utf-8
set langmenu=en_US
"set langmenu=zh_CN
let $LANG = 'en_US.UTF-8'
"let $LANG = 'zh_CN.UTF-8'
"let $LANG = 'en_US.UTF-8'
"}}}

" MapLeader {{{
" 自定义命令用   ,
let mapleader=" "
" vim自带命令用空格来替代:
noremap ; :
language messages en_US.UTF-8
" }}}
" General {{{
set nocompatible
set nobackup
set noswapfile
set history=1024
set autochdir
set whichwrap=b,s,<,>,[,]
set nobomb
set showmatch
set showcmd
set cmdheight=1
set backspace=indent,eol,start whichwrap+=<,>,[,]
" Vim 的默认寄存器和系统剪贴板共享
set clipboard+=unnamed
" 设置 alt 键不映射到菜单栏
set winaltkeys=no
filetype plugin on
syntax enable
highlight StatusLine guifg=SlateBlue guibg=Yellow 
highlight StatusLineNC guifg=Gray guibg=White
" }}}
" ------------------------------------------------------------------------
" GUI {{{
colorscheme darkblue
"colorscheme snazzy
syntax on
"set cursorline
set hlsearch
set number
set relativenumber
set scrolloff=4
" 窗口大小
"set lines=35 columns=140
" 分割出来的窗口位于当前窗口下边/右边
set splitbelow
set splitright
"不显示工具/菜单栏
set guioptions-=T
set guioptions-=m
set guioptions-=L
set guioptions-=r
set guioptions-=b
" 使用内置 tab 样式而不是 gui
set guioptions-=e
set nolist
" set listchars=tab:?\ ,eol:?,trail:·,extends:>,precedes:<
set guifont=JetBrains_Mono:h14:cANSI
" }}}
" ------------------------------------------------------------------------
" Format {{{
set autoindent
set smartindent
set smartcase
set tabstop=4
set shiftwidth=2
set softtabstop=4
syntax on
" FoldMethod {{{
filetype indent plugin on
" vim 文件折叠方式为 marker
augroup fmd_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType python setlocal foldmethod=indent
augroup END
" }}}
" Indent{{{
augroup idt_vim
    autocmd!
    autocmd FileType python setlocal tabstop=4
augroup END
" }}}
"autocmd FileType python set omnifunc=pythoncomplete#Complete
" }}}
" ------------------------------------------------------------------------
"------------------------------NORMAL MODE--------------------------------
nmap <leader>s :source ~/.vimrc<cr>
nmap <leader>w :w<cr>
nmap <leader>e :e ~/.vimrc<cr>
nmap <leader>wq :wq<cr>
nmap <leader>q :q<cr>
nmap <leader>help :help<space>
nmap <leader>h :help<space>
"标签页管理 
"
map <space><cr> :nohl<cr>
map <leader>tn :tabnew<cr>
map <leader>tc :tabclose<cr>
map <leader>th :tabpre<cr>
map <leader>tl :tabnext<cr>
map <leader>to :tabonly<cr>
" 分割窗口管理
noremap <leader>sl :set splitright<CR>:vsplit<CR>
noremap <leader>sh :set nosplitright<CR>:vsplit<CR>
noremap <leader>sk :set nosplitbelow<CR>:split<CR>
noremap <leader>sj :set splitbelow<CR>:split<CR>
" 移动分割窗口
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l
 
" 正常模式下 alt+j,k,h,l 调整分割窗口大小
nnoremap <M-k> :resize +5<cr>
nnoremap <M-j> :resize -5<cr>
nnoremap <M-l> :vertical resize -5<cr>
nnoremap <M-h> :vertical resize +5<cr>
" 快速移动 shift + 方向键
nnoremap <S-k> 3k
nnoremap <S-j> 3j
" goto mark位置
nnoremap gm g`
 
" 打印当前时间
map <F3> a<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
 
" 复制当前文件/路径到剪贴板
nmap ,fn :let @*=substitute(expand("%"), "/", "\\", "g")<CR>
nmap ,fp :let @*=substitute(expand("%:p"), "/", "\\", "g")<CR>
" 设置行号显示 
nnoremap <F2> :setlocal relativenumber!<cr>
" 设置切换Buffer快捷键"
nnoremap <C-left> :bn<CR>
nnoremap <C-right> :bp<CR>
"选择当前行 
nnoremap vv ^vg_
" 重复上次操作
nnoremap U <C-r>
nnoremap <leader>sav :saveas<Space>
nnoremap <C-a> ggvG$

" -----------------------------------------------------------------------
"-------------------------------INSERT MODE-------------------------------
" ------------------------------------------------------------------------
" 插入模式移动光标 alt + 方向键
inoremap <M-j> <Down>
inoremap <M-k> <Up>
inoremap <M-h> <left>
inoremap <M-l> <Right>
inoremap jj <Esc>
"复制当前行到下一行
inoremap <C-d> <esc>"xyy<CR>"xP<CR>2k<CR>i
" 删除前一个Word
inoremap <C-BS> <Esc>bdei
imap <C-V> "+gP
" 转换当前word行为大写
inoremap <C-u> <esc>mzgUiw`za
imap <C-v> "+gP
" 全选所有buffer字符
imap <C-a> <esc>ggvG$
" ------------------------------------------------------------------------
"------------------------------VISUAL MODE---------------------------------
vmap <C-c> "+y
vnoremap <BS> d
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y 
vnoremap  w aw
vnoremap  J :move '>+1<CR>gv=gv
vnoremap  K :move '<-2<CR>gv=gv
" ------------------------------------------------------------------------
" --------------------------COMMAND MODE----------------------------------
" ------------------------------------------------------------------------
map <S-Insert>		"+gP
" 命令模式下的行首尾
cnoremap <C-a> <home>
cnoremap <C-e> <end>
cmap <C-v>		<C-R>+
cmap <S-Insert>		<C-R>+ 
" 常规操作-复制、黏贴、选择 CO/PY CUT PASTE SELETED
exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']
