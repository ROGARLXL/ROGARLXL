" Vim with all enhancements
source $VIMRUNTIME/vimrc_example.vim

" Mouse behavior (the Windows way)
behave mswin

" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

" Lang & Encoding {{{
set fileencodings=utf-8,gbk2312,gbk,gb18030,cp936
set encoding=utf-8
set langmenu=zh_CN
let $LANG = 'en_US.UTF-8'
"language messages zh_CN.UTF-8
" }}}


" Plugin-Mng {{{ 
filetype off
"set shellslash
 
set rtp+=$VIM/vimfiles/bundle/Vundle.vim
call vundle#begin('$VIM/vimfiles/bundle/')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"Plugin 'Valloric/YoucompleteMe'
" Theme
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'connorholyday/vim-snazzy'
" 
Plugin 'jiangmiao/auto-pairs'
" File navigation
Plugin 'preservim/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" }}}
"
" Plugin-vim-airline {{{

" }}}

" Plugin-auto-pairs {{{

" }}}

" Plugin-nerdtree {{{
nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>ntf :NERDTreeFRefreshRoot<CR>
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }
" }}}
"let g:NERDTreeGitStatusIndicatorMapCustom = {
                "\ 'Modified'  :'✹',
                "\ 'Staged'    :'✚',
                "\ 'Untracked' :'✭',
                "\ 'Renamed'   :'➜',
                "\ 'Unmerged'  :'═',
                "\ 'Deleted'   :'✖',
                "\ 'Dirty'     :'✗',
                "\ 'Ignored'   :'☒',
                "\ 'Clean'     :'✔︎',
                "\ 'Unknown'   :'?',
                "\ }
" }}}
" Plugin-YouCompleMe {{{
" YouCompleteMe
let g:pydiction_location='C:\Program Files (x86)\Vim\vim82\vimfiles\ftplugin\complet-edict'
let g:ycm_server_python_interpreter='D:\Program Files\python36\python.exe'
set runtimepath+=$VIM/bundle/YouCompleteMe
let g:ycm_collect_identifiers_from_tags_files = 1           " 开启 YCM 基于标签引擎
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释与字符串中的内容也用于补全
let g:syntastic_ignore_files=[".*\.py$"]
let g:ycm_seed_identifiers_with_syntax = 1                  " 语法关键字补全
let g:ycm_complete_in_comments = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_key_list_select_completion = ['<Tab>', '<Down>']  " 映射按键, 没有这个会拦截掉tab, 导致其他插件的tab不能用.
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
let g:ycm_complete_in_comments = 1                          " 在注释输入中也能补全
let g:ycm_complete_in_strings = 1                           " 在字符串输入中也能补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释和字符串中的文字也会被收入补全
let g:ycm_global_ycm_extra_conf='$VIM/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 0                           " 禁用语法检查
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>" |            
" 回车即选中当前项
"nnoremap <c-j> :YcmCompleter GoToDefinitionElseDeclaration<CR>|    
" 跳转到定义处
"let g:ycm_min_num_of_chars_for_completion=2                 " 从第2个键入字符就开始罗列匹配项
" }}}
" ------------------------------------------------------------------------
" ------------------------------------------------------------------------
" Startup {{{
filetype indent plugin on
" vim 文件折叠方式为 marker
augroup ft_vim
    autocmd!
    "autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}


" General {{{
set nocompatible
set nobackup
set noswapfile
set history=1024
set autochdir
set whichwrap=b,s,<,>,[,]
set nobomb
set backspace=indent,eol,start whichwrap+=<,>,[,]
" Vim 的默认寄存器和系统剪贴板共享
set clipboard+=unnamed
" 设置 alt 键不映射到菜单栏
set winaltkeys=no
" }}}




" GUI {{{
"colorscheme evening
colorscheme snazzy
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
set cursorline
set hlsearch
set number
set relativenumber
" 窗口大小
set lines=35 columns=140
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


" Format {{{
set autoindent
set smartindent
set smartcase
set tabstop=4
set expandtab
set shiftwidth=2
set softtabstop=4
set foldmethod=indent
syntax on
"autocmd FileType python set omnifunc=pythoncomplete#Complete
" }}}

" Keymap {{{
" 自定义命令用   ,
let mapleader=" "
" vim自带命令用空格来替代:
noremap ; :


"-------------------NORMAL MODE-----------------------------
nmap <leader>s :source $VIM/_vimrc<cr>
nmap <leader>w :w<cr>
nmap <leader>e :e $VIM/_vimrc<cr>
nmap <leader>wq :wq<cr>
nmap <leader>q :q<cr>
nmap <leader>help :help<space>
" 标签页管理
map <space><cr> :nohl<cr>
map <leader>tn :tabnew<cr>
map <leader>tc :tabclose<cr>
map <leader>th :tabp<cr>
map <leader>tl :tabn<cr>
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
nnoremap <M-j> :resize +5<cr>
nnoremap <M-k> :resize -5<cr>
nnoremap <M-h> :vertical resize -5<cr>
nnoremap <M-l> :vertical resize +5<cr>
" 快速移动 shift + 方向键
nnoremap <S-k> 3k
nnoremap <S-j> 3j
" goto mark位置
nnoremap gm g`
" 打开当前目录 windows
map <leader>ex :!start explorer %:p:h<CR>
 
" 打开当前目录CMD
map <leader>cmd :!start<cr>
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
"设置/取消高亮显示 //和调整分割窗口有冲突
" nnoremap <M-h> :nohl<CR>
" nnoremap <M-H> :hls<CR>
"跳转至行尾

"-------------------INSERT MODE-----------------------------
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

imap <C-V>		"+gP
" 转换当前word行为大写
inoremap <C-u> <esc>mzgUiw`za
imap <C-v> "+gP

"-------------------VISUAL MODE-----------------------------
vmap <C-c> "+y
vnoremap <BS> d
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y 


"-------------------COMMAND MODE-----------------------------
map <S-Insert>		"+gP
" 命令模式下的行首尾
cnoremap <C-a> <home>
cnoremap <C-e> <end>
cmap <C-V>		<C-R>+
cmap <S-Insert>		<C-R>+ 
" 常规操作-复制、黏贴、选择 COPY CUT PASTE SELETED
exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']

map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
        exec "w"
        if &filetype == 'c'
                exec "!g++ % -o %<"
                exec "!time ./%<"
        elseif &filetype == 'cpp'
                exec "!g++ % -o %<"
                exec "!time ./%<"
        elseif &filetype == 'java'
                exec "!javac %"
                exec "!time java %<"
        elseif &filetype == 'sh'
                :!time bash %
        elseif &filetype == 'python'
                exec "!clear"
                exec "!time python3 %"
        elseif &filetype == 'html'
                exec "!firefox % &"
        elseif &filetype == 'go'
                " exec "!go build %<"
                exec "!time go run %"
        elseif &filetype == 'mkd'
                exec "!~/.vim/markdown.pl % > %.html &"
                exec "!firefox %.html &"
        endif
endfunc
" }}}


"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"+++++++++++++++++++++++++++++++++++++DEVELOP ENV+++++++++++++++++++++++++++++++++
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" JAVA {{{
"setlocal omnifunc=javacomplete#Complete
"autocmd Filetype java set omnifunc=javacomplete#Complete 
"autocmd Filetype java set completefunc=javacomplete#CompleteParamsInf
"inoremap <buffer> <C-X><C-U> <C-X><C-U><C-P> 
"inoremap <buffer> <C-S-Space> <C-X><C-U><C-P>
"autocmd Filetype java,javascript,jsp inoremap <buffer>  .  .<C-X><C-O><C-P>
"}}}



""操作技巧"
"""Normal Mode
" :数字     --跳转到该行
" 数字%     --跳转到百分比位置
" gE        --回到上一个单词
" %         --跳转到匹配的括号
"aw         --'a word' select choice
"iw         --'inner word' select choice
"ap         --'a paragragh'
"ip         --'inner paragraph'
"           --'a' including identifier,but 'inner' not
"           --'w':word  'p':paragragh   'b':block   '()' [] {}
"zn,zN      --打开所有折叠
"za，zA     --打开当前光标位置所有折叠
"zc，zo     --关闭、打开折叠
"
