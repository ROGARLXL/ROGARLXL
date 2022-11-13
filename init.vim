NVIM
"          _____             _____   ____   _____  
"         |  __ \     /\    / ____| / __ \ |  __ \ 
"         | |__) |   /  \  | |  __ | |  | || |__) |
"         |  _  /   / /\ \ | | |_ || |  | ||  _  / 
"         | | \ \  / ____ \| |__| || |__| || | \ \ 
"         |_|  \_\/_/    \_\\_____| \____/ |_|  \_\
"
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"++++++++++++++++++++++++++++FIRST CONFIG+++++++++++++++++++++++++++++++++
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"{{{
"" ==================== Auto load for first time uses ====================
"if empty(glob('~/AppData/Local/nvim/plugged'))
	"silent !curl -fLo ~/AppData/Local/nvim/autoload/plug.vim --create-dirs
				"\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	"autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
"endif
"
"}}}
"-------------------------------------------------------------------------
" Lang & Encoding {{{
set fileencodings=utf-8,gbk2312,gbk,gb18030,cp936
set fileformat=unix
set encoding=utf-8
set langmenu=en_US
"set langmenu=zh_CN
let $LANG = 'en_US.UTF-8'
filetype plugin indent on    " required
"let $LANG = 'zh_CN.UTF-8'
"}}}
"-------------------------------------------------------------------------
" MapLeader {{{
" 自定义命令用   ,
let mapleader=" "
" vim自带命令用空格来替代:
noremap ; :

" }}}
"-------------------------------------------------------------------------
" Plug-Mannage{{{
call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" AutoComplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
" File navigation
" Plug 'preservim/nerdtree'
"CPP
Plug 'octol/vim-cpp-enhanced-highlight'
" Python
Plug 'vim-python/python-syntax'
" git
Plug 'tpope/vim-fugitive'
"Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
" AutoPair
"Plug 'jiangmiao/auto-pairs'
" Taglist
Plug 'majutsushi/tagbar'
" Syntax highlight
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" vim-easymotion
Plug 'easymotion/vim-easymotion'
" fzf
Plug 'junegunn/fzf',
Plug 'junegunn/fzf.vim',
call plug#end()
"""}}}
"-------------------------------------------------------------------------
" Plugin-COC{{{
let g:pydiction_location='$VIM\vimfiles\ftplugin\complet-edict'
let g:coc_global_extensions = ['coc-json', 'coc-tsserver','coc-clangd','coc-python','coc-snippets','coc-calc','coc-explorer','coc-pairs','coc-lightbulb','coc-highlight']
set encoding=utf-8
set hidden

" delays and poor user experience.
set updatetime=200
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
set signcolumn=number
" coc-highlight 光标悬浮处  高亮
autocmd CursorHold * silent call CocActionAsync('highlight')

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" snippets next choice selected
let g:coc_snippet_next = '<tab>'

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use 'gh' to show documentation in preview window.
nnoremap <silent> <leader>gh :call <SID>show_documentation()<CR>

" GoTo code navigation.
nmap <silent> <leader>go <Plug>(coc-definition)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
" auto install extentions 

" confirm choice <CR>
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" coc-explorer
nnoremap <leader>nt :CocCommand explorer<CR> 
" }}}
"-------------------------------------------------------------------------
" Plugin-fugitive-git {{{
nnoremap <leader>git :Git
cnoremap ga Git add<Space>
cnoremap gM Git merge master<CR>
cnoremap gm Git merge<Space>
cnoremap gt Git branch -a<CR>zn:Git checkout<Space> 
cnoremap gc Git commit -m""<left>
cnoremap gu Git pull
cnoremap gp Git push
cnoremap git Git<Space>

" }}}
"-------------------------------------------------------------------------
" Plugin-vimspector {{{
let g:vimspector_enable_mappings = 'HUMAN'
let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-cpptools', 'CodeLLDB' ]
let g:vimspector_adapters = #{
      \   test_debugpy: #{ extends: 'debugpy' }
      \ }

let g:vimspector_configurations = {
      \ "test_debugpy_config": {
      \   "adapter": "test_debugpy",
      \   "filetypes": [ "python" ],
      \   "configuration": {
      \     "request": "launch",
      \     "type": "python",
      \     "cwd": "${fileDirname}",
      \     "args": [],
      \     "program": "${file}",
      \     "stopOnEntry": v:false,
      \     "console": "integratedTerminal",
      \     "integer": 123,
      \   },
      \   "breakpoints": {
      \     "exception": {
      \       "raised": "N",
      \       "uncaught": "",
      \       "userUnhandled": ""
      \     }
      \   }
      \ } }
" MAPING-DEBUG  fork JetBrains
nmap <F5> <Plug>VimspectorContinue
" <F5> Definition Link to 'CompileRunGcc'--><F5>
nmap <S-F5> <Plug>VimspectorStop
nmap <C-F5> <Plug>VimpectorRestart
nmap <M-F5> <Plug>VimspectorPause
nmap <F9> <Plug>VimspectorBreakpoints
nmap <F9> <Plug>VimspectorToggleBreakpoint
nmap <F12> <Plug>VimspectorGoToCurrentLine
nmap <M-F9> <Plug>VimspectorRunToCursor
nmap <F8> <Plug>VimspectorStepOver
nmap <F7> <Plug>VimspectorStepInto
nmap <S-F7> <Plug>VimspectorStepOut
nmap <F10> <Plug>VimspectorUpFrame
nmap <S-F10> <Plug>VimspectorDownFrame
"packadd! vimspector
" }}}
"-------------------------------------------------------------------------
" Plugin-GitGutter{{{
let g:gitgutter_sign_allow_clobber = 1
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 1
let g:gitgutter_preview_win_floating = 1
let g:gitgutter_sign_added = '▎'
let g:gitgutter_sign_modified = '░'
let g:gitgutter_sign_removed = '▏'
let g:gitgutter_sign_removed_first_line = '▔'
let g:gitgutter_sign_modified_removed = '▒'
"nnoremap <LEADER>gf :GitGutterFold<CR>
"nnoremap H :GitGutterPreviewHunk<CR>
"nnoremap <LEADER>g- :GitGutterPrevHunk<CR>
"nnoremap <LEADER>g= :GitGutterNextHunk<CR>
"}}}
"-------------------------------------------------------------------------
" Plugin-FZF{{{
nnoremap <leader>f :FZF<CR>
nnoremap <leader>fa :FZF<space>
nnoremap <leader>ff :FZF<space>D:/<CR>
"}}}
"-------------------------------------------------------------------------
" Plugin-Taglist {{{
nmap <leader>ll :TagbarToggle<cr>
let	g:tagbar_ctags_bin='~/AppData/Local/nvim/ctags.exe'
"默认打开vim时自动开启taglist
"let Tlist_Auto_Open=1	"默认打开vim时自动开启taglist
""自动更新tag
"let Tlist_Auto_Update=1 "自动更新tag
""只显示当前文件
"let Tlist_Show_One_File=1	"只显示当前文件
""taglist窗口的宽度
"let Tlist_WinWidth=40	"taglist窗口的宽度
"" taglist Height
"let Tlist_WinHeight=60
""如果退出时仅剩taglist窗口，则直接退出vim
"let Tlist_Exit_OnlyWindow=1	"如果退出时仅剩taglist窗口，则直接退出vim
"let Tlist_Use_Right_Window=1

"" }}}
"-------------------------------------------------------------------------
" General {{{
set nocompatible
"设置无备份文件
"set nobackup
"设置没有swap
"set noswapfile
set history=1024
set directory=~/AppData/Local/nvim/swp
set backupdir=~/AppData/Local/nvim/backup
set undodir=~/AppData/Local/nvim/un
set autochdir
set whichwrap=b,s,<,>,[,]
set nobomb
set backspace=indent,eol,start whichwrap+=<,>,[,]
" Vim 的默认寄存器和系统剪贴板共享
"set clipboard+=unnamed
" 设置 alt 键不映射到菜单栏
set winaltkeys=no
" }}}
" ------------------------------------------------------------------------
" GUI {{{
" colorscheme snazzy
syntax on
"
"set cursorline
set hlsearch
set number
set relativenumber
set scrolloff=4
" 窗口大小//nvim 输入这个设置会影响窗口显示
" set lines=35 columns=140
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
" }}}
" ------------------------------------------------------------------------
" Format {{{
set autoindent
set smartindent
set smartcase
set tabstop=4
"set expandtab
set shiftwidth=2
set softtabstop=4
set foldmethod=indent
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
"{{{
nmap <leader>s :source ~/AppData/Local/nvim/init.vim<cr>
nmap <leader>w :w<cr>
nmap <leader>e :e ~/AppData/Local/nvim/init.vim<cr>
nmap <leader>wq :wq<cr>
nmap <leader>q :q<cr>
nmap <leader>help :help<space>
nmap <leader>h :help<space>
nmap <leader>sav :saveas<Space>
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
 
nmap <leader>bb :buffers<CR>
nmap <leader>bn :bnext<CR>
nmap <leader>bp :bprevious<CR>
nmap <leader>bf :bfirst<CR>
nmap <leader>bl :blast<CR>

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
" 打开当前目录 windows
"map <leader>ex :!start explorer %:p:h<CR>
 
" 打开当前目录CMD
"map <leader>cmd :!start<cr>
" 打印当前时间
map <F3> a<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
 
" 复制当前文件/路径到剪贴板
"nmap ,fn :let @*=substitute(expand("%"), "/", "\\", "g")<CR>
"nmap ,fp :let @*=substitute(expand("%:p"), "/", "\\", "g")<CR>
" 设置行号显示 
nnoremap <F2> :setlocal relativenumber!<cr>
" 设置切换Buffer快捷键"
nnoremap <C-left> :bn<CR>
nnoremap <C-right> :bp<CR>
"选择当前行 
nnoremap vv ^vg_
" 重复上次操作
nnoremap U <C-r>
nnoremap <C-a> ggvG$
"}}}
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
" ------------------------------------------------------------------------
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
" ------------------------------------------------------------------------
" --------------------------SCRIPT COLOR----------------------------------
" ------------------------------------------------------------------------
" C {{{
"autocmd BufNewFile *.c 0r $VIM\vimfiles\template\c.tpl
"autocmd filetype c highlight cNumber guifg=#FFE920
"autocmd filetype c highlight cString gui=Italic guifg=#C17753
"autocmd filetype c highlight cInclude gui=Italic guifg=#CB59E8
"autocmd filetype c highlight cDefine guifg=#FF7DFF
"autocmd filetype c highlight Conditional guifg=#D881ED
"autocmd filetype c highlight cBoolean guifg=#E37795
"}}}

" ============================ Necessary Commands to Execute ====================
exec "nohlsearch"
exec "cd ~/jupyter/"

"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"
" 操作技巧{{{
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
"zj         -- next fold positon
"zk         -- pre fold positon
"zm			-- fold more
"zr			-- fold reduce
"
":lmap     要查看键映射的列表，用这个命令: >
":echo globpath(&rtp, "keymap/*.vim")  要查看系统有哪些键盘映射表文件，在 GUI 上你可以用 Edit/Keymap 菜单。否则你可以
"Ctrl+a  先用Ctrl+V选定块然后按g C-a进行递增
"Ctrl+x  先用Ctrl+V选定块然后按g C-x进行递增
":verbose map <key> 查看key的映射位置
"
"文本排版
" center   居中
" left     靠左
" right    靠右
"
":term bash 打开bash终端可以运行shell程序；
":term 直接打开windows终端
" <leader>c<space> NERDCommenterToggle
"}}}
