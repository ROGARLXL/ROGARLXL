" Vim with all enhancements----GVIM
"          _____             _____   ____   _____  
"         |  __ \     /\    / ____| / __ \ |  __ \ 
"         | |__) |   /  \  | |  __ | |  | || |__) |
"         |  _  /   / /\ \ | | |_ || |  | ||  _  / 
"         | | \ \  / ____ \| |__| || |__| || | \ \ 
"         |_|  \_\/_/    \_\\_____| \____/ |_|  \_\
"
" VIM_EXAMPLE{{{
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
"}}}

" Lang & Encoding {{{
set fileencodings=utf-8,gbk2312,gbk,gb18030,cp936
set encoding=utf-8
set langmenu=zh_CN
let $LANG = 'zh_CN.UTF-8'
"let $LANG = 'en_US.UTF-8'
"}}}

" MapLeader {{{
" 自定义命令用   ,
let mapleader=" "
" vim自带命令用空格来替代:
noremap ; :
language messages en_US.UTF-8
" }}}
" ------------------------------------------------------------------------
" ------------------------------------------------------------------------
" Plugin-Mng {{{ 
filetype off
"set shellslash
set rtp+=$VIM/vimfiles/bundle/Vundle.vim
call plug#begin('$VIM/vimfiles/bundle/')
" AutoComplete
"Plug 'Valloric/YoucompleteMe'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Theme
Plug 'vim-airline/vim-airline' 
Plug 'vim-airline/vim-airline-themes'
Plug 'connorholyday/vim-snazzy'
" Python
Plug 'jiangmiao/auto-pairs'
"Plug 'skywind3000/asyncrun.vim'
Plug 'puremourning/vimspector'
"Plug 'python-mode/python-mode'
" File navigation
Plug 'preservim/nerdtree'
" git
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Taglist
Plug 'majutsushi/tagbar'
" Asynchronous Lint Engine //Syntax Error Check 
"Plug 'dense-analysis/ale'
" Markdown 
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.nvim' 
Plug 'ferrine/md-img-paste.vim'
"Plug 'iamcco/markdown-preview.vim' 
call plug#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" }}}
 
" Plugin-Navigation{{{
"" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
" adding to vim-airline's statusline
"let g:webdevicons_enable_airline_statusline = 1
" loading the plugin
"let g:webdevicons_enable = 1
"" }}}

" Plugin-fugitive-git {{{
nnoremap <leader>Git :Git
" }}}

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

" Plugin-GitGutter{{{
let g:gitgutter_sign_allow_clobber = 0
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 0
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

" Plugin-COC{{{
let g:pydiction_location='$VIM\vimfiles\ftplugin\complet-edict'
set encoding=utf-8
set hidden
" delays and poor user experience.
set updatetime=200
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
set signcolumn=number
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

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


" }}} 

" Plugin-vim-airline {{{
" }}}

" [X]Plugin-PyMode {{{
"let g:pymode = 0
"let g:pymode_run = 0
"let g:pymode_run_bind='<leader>r'
"let g:pymode_rope_goto_definition_bind = ''
"let g:pymode_python = 'python'
"let g:pymode_indent = 1
""Turn on code checking                                           *'g:pymode_lint'*
"let g:pymode_lint = 1
""Check code on every save (if file has been modified)   *'g:pymode_lint_on_write'*
"let g:pymode_lint_on_write = 1
""Check code on every save (every)                     *'g:pymode_lint_unmodified'*
"let g:pymode_lint_unmodified = 0
""Check code when editing (on the fly)                     *'g:pymode_lint_on_fly'*
"let g:pymode_lint_on_fly = 0
""Show error message if cursor placed at the error line   *'g:pymode_lint_message'*
"let g:pymode_lint_message = 1
"" Default code checkers (you could set several)          *'g:pymode_lint_checkers'*
"let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']
"" Skip errors and warnings
"let g:pymode_lint_ignore = ["E501", "W",]
"" Auto open cwindow (quickfix) if any errors have been found
"let g:pymode_lint_cwindow = 1
"" Definitions for |signs
"let g:pymode_lint_signs = 1
"let g:pymode_lint_todo_symbol = 'WW'
"let g:pymode_lint_comment_symbol = 'CC'
"let g:pymode_lint_visual_symbol = 'RR'
"let g:pymode_lint_error_symbol = 'EE'
"let g:pymode_lint_info_symbol = 'II'
"let g:pymode_lint_pyflakes_symbol = 'FF'
""
"COMMAND
"|:PymodeRopeAutoImport| -- Resolve import for element under cursor
"|:PymodeRopeModuleToPackage| -- Convert current module to package
"|:PymodeRopeNewProject| -- Open new Rope project in current working directory
"|:PymodeRopeRedo| -- Redo changes from last refactoring
"|:PymodeRopeRegenerate| -- Regenerate the project cache
"|:PymodeRopeRenameModule| -- Rename current module
"|:PymodeRopeUndo| -- Undo changes from last refactoring
"
"
"}}}

" Plugin-Taglist {{{
nmap <leader>ll :TagbarToggle<cr>

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

" Plugin-ferrine/md-img-paste.vim {{{
autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
" there are some defaults for image directory and image name, you can change them
let g:mdip_imgdir_absolute = 'D:\0-ROGAR\3-Code\0-Notes\0MarkDownImage'
let g:mdip_imgname = 'moimage'
"
function! g:LatexPasteImage(relpath)
    execute "normal! i\\includegraphics{" . a:relpath . "}\r\\caption{I"
    let ipos = getcurpos()
    execute "normal! a" . "mage}"
    call setpos('.', ipos)
    execute "normal! ve\<C-g>"
endfunction
autocmd FileType markdown let g:PasteImageFunction = 'g:MarkdownPasteImage'
autocmd FileType tex let g:PasteImageFunction = 'g:LatexPasteImage'

  "" }}}

" Plugin-Coc.VIM {{{
let g:coc_node_path='C:\Program Files (x86)\nodejs\node.exe'
" }}}

" Plugin-auto-pairs {{{

" }}}

" Plugin-Markdown {{{
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0
"
"" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
"let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
"let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
"let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
"let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
"let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
"let g:mkdp_browser = 'edge'

" set to 1, echo preview page url in command line when open preview page
" default is 0
"let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
"let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
"let g:mkdp_preview_options = {
    "\ 'mkit': {},
    "\ 'katex': {},
    "\ 'uml': {},
    "\ 'maid': {},
    "\ 'disable_sync_scroll': 0,
    "\ 'sync_scroll_type': 'middle',
    "\ 'hide_yaml_meta': 1,
    "\ 'sequence_diagrams': {},
    "\ 'flowchart_diagrams': {},
    "\ 'content_editable': v:false,
    "\ 'disable_filename': 0
    "\ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
"let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
"let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
"let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
"let g:mkdp_page_title = '「${name}」'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
"let g:mkdp_filetypes = ['markdown']
" }}}

"" Plugin-nerdtree {{{
nnoremap <leader>nt :NERDTreeToggle<CR>
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeWinPos="left"
"nnoremap <leader>ntf :NERDTreeFRefreshRoot<CR>
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
" ------------------------------------------------------------------------
" ------------------------------------------------------------------------

" ------------------------------------------------------------------------
" General {{{
set nocompatible
set nobackup
set noswapfile
set history=1024
set directory=D:\0-ROGAR\3-Code\0-Notes\vim-config\swp
set backupdir=D:\0-ROGAR\3-Code\0-Notes\vim-config\backup
set undodir=D:\0-ROGAR\3-Code\0-Notes\vim-config\un
set autochdir
set whichwrap=b,s,<,>,[,]
set nobomb
set backspace=indent,eol,start whichwrap+=<,>,[,]
" Vim 的默认寄存器和系统剪贴板共享
set clipboard+=unnamed
" 设置 alt 键不映射到菜单栏
set winaltkeys=no
" }}}
" ------------------------------------------------------------------------
" GUI {{{
"colorscheme evening
colorscheme snazzy
"source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim
set cursorline
set hlsearch
set number
set relativenumber
set scrolloff=4
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
nmap <leader>s :source $VIM/_vimrc<cr>
nmap <leader>w :w<cr>
nmap <leader>e :e $VIM/_vimrc<cr>
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
" 重复上次操作
nnoremap U <C-r>
nnoremap <leader>sav :saveas<Space>

" ------------------------------------------------------------------------
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
imap <C-V>		"+gP
" 转换当前word行为大写
inoremap <C-u> <esc>mzgUiw`za
imap <C-v> "+gP
" 全选所有buffer字符
imap <C-a> <esc>ggvG
" ------------------------------------------------------------------------
"------------------------------VISUAL MODE---------------------------------
vmap <C-c> "+y
vnoremap <BS> d
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y 

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

"map <F5> :call CompileRunGcc()<CR>
"func! CompileRunGcc()
        "exec "w"
        "if &filetype == 'c'
                "exec "!gcc % -o %<"
                "exec "AsyncRun -raw %<"
                "exec "copen"
                "exec "wincmd p" 
        "elseif &filetype == 'cpp'
                "exec "!g++ % -o %<"
                "exec "!time ./%<"
        "elseif &filetype == 'java'
                "exec "!javac %"
                "exec "!time java %<"
        "elseif &filetype == 'sh'
                ":!time bash %
        "elseif &filetype == 'html'
                "exec "!firefox % &"
        "elseif &filetype == 'go'
                "exec "!go build %<"
                "exec "!time go run %"
        "elseif &filetype == 'python'
            "if search("@profile")
                "exec "AsyncRun kernprof -l -v %"
                "exec "copen"
                "exec "wincmd p"
            "elseif search("set_trace()")
                "exec "!python %"
            "else
                "exec "AsyncRun -raw python %"
                "exec "copen"
                "exec "wincmd p"
            "endif
        "elseif &filetype == 'markdown'
                "exec "MarkdownPreview"
        "endif
"endfunc

map <F4> :call CodeFormatter()<CR>
func! CodeFormatter()
        exec "w"
        if &filetype == 'markdown'
                exec "TableFormat"
        endif
endfunc


" ============================ Necessary Commands to Execute ====================
exec "nohlsearch"

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

" PYTHON {{{
"elseif &filetype == 'python'
                "if search(""@profile")
                    "exec ""AsyncRun kernprof -l -v %"
                    "exec ""copen"
                    "exec ""wincmd p"
                "elseif search(""set_trace()")
                    "exec ""!python %"
                "else
                    "exec ""AsyncRun -raw python %"
                    "exec ""copen"
                    "exec ""wincmd p"
                "endif
        "
" }}}
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
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
