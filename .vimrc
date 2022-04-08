" ---------------------------GENERAL---------------------
filetype plugin on
syntax enable
highlight StatusLine guifg=SlateBlue guibg=Yellow 
highlight StatusLineNC guifg=Gray guibg=White
set cmdheight=4
set backspace=2
set showmatch
set smartcase
set relativenumber
set tabstop=4
set shiftwidth=2
set number
set autoindent
set smartindent

let mapleader=" "
nnoremap ; :
" -------------------------------------------------------
" ---------------------------GUI-------------------------
color evening
set nocursorline
set guifont=JetBrains_Mono:h14:cANSI
" -------------------------------------------------------
" ---------------------------PLUGIN----------------------
" -------------------------------------------------------
" ---------------------------INSET MODE------------------
inoremap jj <esc>
" -------------------------------------------------------
" -------------------------------------------------------

" ---------------------------NORMAL MODE-----------------
nmap <leader>s :source ~/.vimrc<cr>
nmap <leader>w :w<cr>
nmap <leader>wq :wq<cr>
nmap <leader>q :q<cr>
nmap <leader>help :help<space>
" 标签页管理 
" "
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
nnoremap <F2> :setlocal relativenumber!<cr>
" 设置切换Buffer快捷键"
nnoremap <C-left> :bn<CR>
nnoremap <C-right> :bp<CR>
"选择当前行 
nnoremap vv ^vg_

"alt + 方向键
inoremap <M-j> <Down>
inoremap <M-k> <Up>
inoremap <M-h> <left>
inoremap <M-l> <Right>

"复制当前行到下一行
inoremap <C-d> <esc>"xyy<CR>"xP<CR>2k<CR>i
"" 删除前一个Word
inoremap <C-BS> <Esc>bdei

imap <C-V>		"+gP
" 转换当前word行为大写
inoremap <C-u> <esc>mzgUiw`za
imap <C-v> "+gP
" -------------------------------------------------------
" ---------------------------VISUAL MODE-----------------
" -------------------------------------------------------
" ---------------------------COMMAND MODE----------------
" -------------------------------------------------------
" -------------------------------------------------------
