" Vim with all enhancements ---- NVIM
"          _____             _____   ____   _____  
"         |  __ \     /\    / ____| / __ \ |  __ \ 
"         | |__) |   /  \  | |  __ | |  | || |__) |
"         |  _  /   / /\ \ | | |_ || |  | ||  _  / 
"         | | \ \  / ____ \| |__| || |__| || | \ \ 
"         |_|  \_\/_/    \_\\_____| \____/ |_|  \_\
"                                                                      
" STARTUP & Pre-CONFIG {{{
"
"{{{
"" ==================== Auto load for first time uses ====================
if empty(glob('~/AppData/Local/nvim/plugged'))
	silent !curl -fLo ~/AppData/Local/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
"
"}}}
set mouse=a
" Mouse behavior (the Windows way)
behave mswin
set fileencodings=utf-8,gbk2312,gbk,gb18030,cp936
set encoding=utf-8
set langmenu=zh_CN
"let $LANG = 'zh_CN.UTF-8'
let $LANG = 'en_US.UTF-8'
language messages en_US.UTF-8
filetype plugin indent on    " required
" 自定义命令用   ,
let mapleader=" "
" vim自带命令用空格来替代:
noremap ; :
" }}}


" ------------------------------------------------------------------------
" PLUG -LIST{{{
" ------------------------------------------------------------------------
call plug#begin('~/AppData/Local/nvim/plugged')
" Theme
Plug 'vim-airline/vim-airline' 
" Plug 'vim-airline/vim-airline-themes'
Plug 'tamton-aquib/staline.nvim'
Plug 'connorholyday/vim-snazzy'
Plug 'kyazdani42/nvim-web-devicons'
" Python
Plug 'jiangmiao/auto-pairs'
Plug 'vim-python/python-syntax'
"CPP
Plug 'octol/vim-cpp-enhanced-highlight'
"

" File navigation
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Debug
"""Plug 'puremourning/vimspector'
Plug 'airblade/vim-gitgutter'

" git
Plug 'tpope/vim-fugitive'
"Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
" Taglist
Plug 'majutsushi/tagbar'
" AutoCompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()
" }}}
" ------------------------------------------------------------------------
" ------------------------------------------------------------------------
" Plugin-Navigation{{{
"" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 0 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

"  ====
"  }}}

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

" Plugin-vim-airline {{{
" }}}
" 
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
"nmap <F9> <Plug>VimspectorBreakpoints
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
set signcolumn=yes
let g:gitgutter_sign_allow_clobber = 0
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_preview_win_floating = 1
let g:gitgutter_sign_added = '▎'
let g:gitgutter_sign_modified = '░'
let g:gitgutter_sign_removed = '▏'
let g:gitgutter_sign_removed_first_line = '▔'
let g:gitgutter_sign_modified_removed = '▒'
"let g:gitgutter_sign_allow_clobber = 1
"let g:gitgutter_map_keys = 1
"let g:gitgutter_override_sign_column_highlight = 1
"let g:gitgutter_preview_win_floating = 1
"let g:gitgutter_sign_added = '▎'
"let g:gitgutter_sign_modified = '▌'
"let g:gitgutter_sign_removed = '▏'
"let g:gitgutter_sign_removed_first_line = '▔'
"let g:gitgutter_sign_modified_removed = '▍'
" highlight the GitGutter 
"highlight GitGutterAdd    guifg=#01FF99 ctermfg=2
"highlight GitGutterChange guifg=#01FFFF ctermfg=3
"highlight GitGutterDelete guifg=#ff2223 ctermfg=1
"nnoremap <LEADER>gf :GitGutterFold<CR>
nnoremap H :GitGutterPreviewHunk<CR>
nnoremap <LEADER>g- :GitGutterPrevHunk<CR>
nnoremap <LEADER>g= :GitGutterNextHunk<CR>
"}}}

" Plugin-Taglist {{{
nmap <leader>ll :TagbarToggle<cr>
"
"}}}

" Plugin-nerdtree {{{
nnoremap <leader>nt :call OpenCurrentDir()<CR>
function! OpenCurrentDir()
  execute "NERDTreeToggle"
  execute "NERDTreeRefreshRoot"
endfunction
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeWinPos="left"
""" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
" adding to vim-airline's statusline
let g:webdevicons_enable_airline_statusline = 1
let g:airline_powerline_fonts = 1
" loading the plugin
let g:webdevicons_enable = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:webdevicons_enable_nerdtree = 1
nnoremap <leader>ntf :NERDTreeRefreshRoot<CR>
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

" Plugin-coc.vim{{{
let g:coc_node_path='C:\Program Files (x86)\nodejs\node.exe'
let g:pydiction_location='$VIM\vimfiles\ftplugin\complet-edict'

set encoding=utf-8
set hidden
set updatetime=201
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
"set signcolumn=number
" coc-highlight 光标悬浮处  高亮
autocmd CursorHold * silent call CocActionAsync('highlight')
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
"inoremap <silent><expr> <TAB>
      "\ pumvisible() ? coc#_select_confirm() :
      "\ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      "\ <SID>check_back_space() ? "\<TAB>" :
      "\ coc#refresh()

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 2
  return !col || getline('.')[col - 2]  =~# '\s'
endfunction
let g:coc_snippet_next = '<tab>'
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
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
  if (index(['vim','help'], &filetype) >= 1)
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
let g:coc_global_extensions = ['coc-vimlsp','coc-json', 'coc-tsserver','coc-clangd','coc-python','coc-snippets','coc-calc']

" confirm choice <CR>
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" " append result on current expression
" nmap <Leader>ca <Plug>(coc-calc-result-append)
" replace result on current expression
"}}}

" Plugin nvim-treesitter{{{
"
" }}}

" General {{{
set nocompatible
set history=1024
set autochdir
set whichwrap=b,s,<,>,[,]
set nobomb
set backspace=indent,eol,start whichwrap+=<,>,[,]
" Vim 的默认寄存器和系统剪贴板共享
set clipboard+=unnamed
" 设置 alt 键不映射到菜单栏
set winaltkeys=no
"设置备份文件存放位置
silent !mkdir -p $HOME/AppData/Local/nvim/tmp/backup
silent !mkdir -p $HOME/AppData/Local/nvim/tmp/undo
"silent !mkdir -p $HOME/AppData/Local/nvim/tmp/sessions
set backupdir=$HOME/AppData/Local/nvim/tmp/backup,.
set directory=$HOME/AppData/Local/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=$HOME/AppData/Local/nvim/tmp/undo,.
endif

" }}}

" GUI {{{
"colorscheme evening
colorscheme snazzy
""let g:SnazzyTransparent=1
set cursorline
set hlsearch
set number
set relativenumber
set scrolloff=5
" 窗口大小
"set lines=49 columns=140
" 分割出来的窗口位于当前窗口下边/右边
set splitbelow
set splitright
set nolist
"set listchars=tab:?\ ,eol:?,trail:·,extends:>,precedes:<
"set guifont=JetBrains_Mono:20
set guifont=JetBrains_Mono:h19:cANSI
" }}}

" Format {{{
set autoindent
set smartindent
set ignorecase
set smartcase
set tabstop=4
set expandtab
set shiftwidth=2
set softtabstop=4
set shortmess+=c
syntax on
augroup ft_vim
    autocmd!
    autocmd Filetype python setlocal foldmethod=indent
    autocmd Filetype c setlocal foldmethod=marker
    autocmd FileType vim setlocal foldmethod=marker
augroup end
" Indent{{{
augroup idt_vim
    autocmd!
    autocmd FileType python setlocal tabstop=4
augroup END
" }}}
"autocmd FileType python set omnifunc=pythoncomplete#Complete
" }}}

" Keymap {{{
"-------------------NORMAL MODE-----------------------------
nmap <leader>s :source ~/AppData/Local/nvim/init.vim<cr>
nmap <leader>w :w<cr>
nmap <leader>e :e ~/AppData/Local/nvim/init.vim<cr>
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

" Buf Operate
" 
nmap <leader>bb :buffers<CR>
nmap <leader>bn :bnext<CR>
nmap <leader>bp :bprevious<CR>
nmap <leader>bf :bfirst<CR>
nmap <leader>bl :blast<CR>
nmap <leader>b :b

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
nnoremap E $
nnoremap W ^
 
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
cmap <C-v>		<C-R>+
cmap <S-Insert>		<C-R>+ 
" 常规操作-复制、黏贴、选择 CO/PY CUT PASTE SELETED
"exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
"exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']

map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
        exec "w"
        if &filetype == 'c'
                exec "!gcc % -o %<"
                exec "AsyncRun -raw %<"
                exec "copen"
                exec "wincmd p" 
        elseif &filetype == 'cpp'
                exec "!g++ % -o %<"
                exec "!time ./%<"
        elseif &filetype == 'java'
                exec "!javac %"
                exec "!time java %<"
        elseif &filetype == 'sh'
                :!time bash %
        elseif &filetype == 'html'
                exec "!firefox % &"
        elseif &filetype == 'go'
                exec "!go build %<"
                exec "!time go run %"
        elseif &filetype == 'python'
            if search("@profile")
                exec "AsyncRun kernprof -l -v %"
                exec "copen"
                exec "wincmd p"
            elseif search("set_trace()")
                exec "!python %"
            else
                exec "AsyncRun -raw python %"
                exec "copen"
                exec "wincmd p"
            endif
        elseif &filetype == 'markdown'
                "exec "!~/.vim/markdown.pl % > %.html &"
                "exec "!google chrome %.html &"
                exec "MarkdownPreview"
        endif
endfunc

map <F4> :call CodeFormatter()<CR>
func! CodeFormatter()
        exec "w"
        if &filetype == 'markdown'
                exec "TableFormat"
        endif
endfunc
"}}}
