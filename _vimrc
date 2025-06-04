" Vim with all enhancements----GVIM
"          _____             _____   ____   _____  
"         |  __ \     /\    / ____| / __ \ |  __ \ 
"         | |__) |   /  \  | |  __ | |  | || |__) |
"         |  _  /   / /\ \ | | |_ || |  | ||  _  / 
"         | | \ \  / ____ \| |__| || |__| || | \ \ 
"         |_|  \_\/_/    \_\\_____| \____/ |_|  \_\
"
" ------------------------------------------------------------------------
" ---------------------------FIRST SETTING-------------------------------
" ------------------------------------------------------------------------ 

" Lang & Encoding {{{
set fileencodings=utf-8,gbk2312,gbk,gb18030,cp936
" set the fileformat is unix or dos
set fileformat=unix
set encoding=utf-8
set langmenu=en_US
" don't set langmenu----the bottom line of gui
" set langmenu=zh_CN
"}}}

" MapLeader {{{
" 自定义命令用   ,
let mapleader=" "
" vim自带命令用空格来替代:
noremap ; :
language messages en_US.UTF-8

" }}}
" ------------------------------------------------------------------------
" ---------------------------PLUGIN SETTING-------------------------------
" ------------------------------------------------------------------------ 
" Plugin-Mng {{{ 
filetype off
"set shellslash
set rtp+=$VIM/vimfiles/bundle/Vundle.vim
set rtp+=C:\ProgramData\chocolatey\bin
call plug#begin('$VIM/vimfiles/bundle/')
" StartUp
Plug 'dstein64/vim-startuptime'
Plug 'mhinz/vim-startify'

" AutoComplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'honza/vim-snippets'

" Airline
Plug 'vim-airline/vim-airline' 
Plug 'vim-airline/vim-airline-themes'

" Theme -- colorscheme
Plug 'connorholyday/vim-snazzy'
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'KeitaNakamura/neodark.vim'
Plug 'sainnhe/everforest'
Plug 'sainnhe/sonokai'
Plug 'joshdick/onedark.vim'
Plug 'voidekh/kyotonight.vim'

" Python  Syntax
Plug 'jiangmiao/auto-pairs'
Plug 'vim-python/python-syntax'
" CPP Syntax
Plug 'octol/vim-cpp-enhanced-highlight'
" Verilog automatic 
Plug 'HonkW93/automatic-verilog'
Plug 'vhda/verilog_systemverilog.vim'
" 
" Debugger
Plug 'puremourning/vimspector'

" NERDTree
" Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'

" Git Tool Instegrated
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" fzf
Plug 'junegunn/fzf',
Plug 'junegunn/fzf.vim',
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' },

" vim-easymotion
Plug 'easymotion/vim-easymotion'
" Plug 'justinmk/vim-sneak'

" Taglist
Plug 'majutsushi/tagbar'
Plug 'godlygeek/tabular'
Plug 'liuchengxu/vista.vim'

" Markdown 
Plug 'preservim/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'img-paste-devs/img-paste.vim'

" Which Keymap
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

" commentary
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-commentary'

" mult-cursor
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" Terminal
Plug 'voldikss/vim-floaterm'

" Calender
Plug 'mattn/calendar-vim'

" Buffertabline 
Plug 'zefei/vim-wintabs'
Plug 'zefei/vim-wintabs-powerline'
call plug#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" }}}

" Plugin-Easymotion{{{
" Gif config
" map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
let g:EasyMotion_smartcase = 1

" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" Gif config
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)

" Gif config
map  <leader>/ <Plug>(easymotion-sn)
omap <leader>/ <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  <leader>n <Plug>(easymotion-next)
map  <leader>N <Plug>(easymotion-prev)


"""}}}

"VIM WHICH KEY{{{
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
" By default timeoutlen is 1000 ms
set timeoutlen=500


"""}}}

" Plugin-fugitive-git {{{
nnoremap <leader>git :Git
cnoremap ga Git add<Space>.
cnoremap gM Git merge master
cnoremap gm Git merge<Space>
cnoremap gb Git branch -a<CR>zn:Git checkout<Space> 
cnoremap gc Git commit -m""<left>
cnoremap gu Git pull
cnoremap gp Git push
cnoremap git Git<Space>
" }}}

" Plugin-LeaderF/FZF{{{
" nnoremap <leader>f :FZF<CR>
" nnoremap <leader>fa :FZF<space>
" nnoremap <leader>ff :FZF<space>D:/<CR>
" don't show the help in normal mode
let g:Lf_HideHelp = 0
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font':"JetBrainsMono NF" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

" noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
" noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
" search visually selected text literally
" xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
" noremap go :<C-U>Leaderf! rg --recall<CR>

" should use `Leaderf gtags --update` first
" let g:Lf_GtagsAutoGenerate = 0
" let g:Lf_Gtagslabel = 'native-pygments'
" noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
" noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
" noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
" noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
" noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>
"}}}

" Plugin-nerdcommenter{{{
"
noremap cm g@
noremap cmm g@_
"
"" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1
" [count]<leader>cc |NERDCommenterComment|
"
" Comment out the current line or text selected in visual mode.
"
" [count]<leader>cn |NERDCommenterNested|
"
" Same as cc but forces nesting.
"
" [count]<leader>c<space> |NERDCommenterToggle|
"
" Toggles the comment state of the selected line(s). If the topmost selected line is commented, all selected lines are uncommented and vice versa.
"
" [count]<leader>cm |NERDCommenterMinimal|
"
" Comments the given lines using only one set of multipart delimiters.
"
" [count]<leader>ci |NERDCommenterInvert|
"
" Toggles the comment state of the selected line(s) individually.
"
" [count]<leader>cs |NERDCommenterSexy|
"
" Comments out the selected lines with a pretty block formatted layout.
"
" [count]<leader>cy |NERDCommenterYank|
"
" Same as cc except that the commented line(s) are yanked first.
"
" <leader>c$ |NERDCommenterToEOL|
"
" Comments the current line from the cursor to the end of line.
"
" <leader>cA |NERDCommenterAppend|
"
" Adds comment delimiters to the end of line and goes into insert mode between them.
"
" |NERDCommenterInsert|
"
" Adds comment delimiters at the current cursor position and inserts between. Disabled by default.
"
" <leader>ca |NERDCommenterAltDelims|
"
" Switches to the alternative set of delimiters.
"
" [count]<leader>cl |NERDCommenterAlignLeft [count]<leader>cb |NERDCommenterAlignBoth
"
" Same as |NERDCommenterComment| except that the delimiters are aligned down the left side (<leader>cl) or both sides (<leader>cb).
"
" [count]<leader>cu |NERDCommenterUncomment|
"
" Uncomments the selected line(s).

"""}}}

" Plugin-vimspector {{{
"let g:vimspector_enable_mappings = 'HUMAN'
let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-cpptools', 'CodeLLDB' ]
let g:vimspector_adapters = #{
      \   test_debugpy: #{ extends: 'debugpy' },
      \   test_cpp: #{ extends: 'vscode-cpptools' }
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
      \ },
	  \ "test_cpp_config": {
      \   "adapter": "vscode-cpptools",
      \   "filetypes": [ "cpp", "c", "objc", "rust"],
	  \   "configuration": {
	  \		"request": "launch",
	  \		"program": "./debug_C_vimspector",
	  \		"stopAtEntry": v:true
	  \	}
      \ }
	  \ }

" MAPING-DEBUG  fork JetBrains
" nmap <F5> <Plug>VimspectorContinue
nmap <F5> :call CodeRunner()<CR>
func! CodeRunner()
        exec "w"
        if &filetype == 'markdown'
			exec "MarkdownPreview"
		else
		    execute "call vimspector#Continue()"
        endif
endfunc

nmap <S-F5> <Plug>(VimspectorReset)
nmap <C-F5> <Plug>(VimspectorRestart)
nmap <M-F5> <Plug>VimspectorPause

nmap <F9> <Plug>VimspectorToggleBreakpoint
nmap <F12> <Plug>VimspectorGoToCurrentLine
nmap <M-F9> <Plug>VimspectorRunToCursor
nmap <F8> <Plug>VimspectorStepOver
nmap <F7> <Plug>VimspectorStepInto
nmap <S-F7> <Plug>VimspectorStepOut
nmap <F10> <Plug>VimspectorUpFrame
nmap <S-F10> <Plug>VimspectorDownFrame

nmap <F6> :call CompileFunc()<CR>
func! CompileFunc()
        exec "w"
        if &filetype == 'c'
                exec "!gcc -g % -o debug_C_vimspector"
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
        elseif &filetype == 'markdown'
                exec "MarkdownPreview"
        endif
endfunc
"This is sign of vimspector PC\BP
sign define vimspectorBPDisabled text=☞ texthl=Normal
sign define vimspectorBP text=🔶 texthl=Normal
sign define vimspectorPC text=☛ texthl=Normal
"packadd! vimspector
" }}}

" Plugin-GitGutter{{{
set signcolumn=yes
let g:gitgutter_sign_allow_clobber = 1
let g:gitgutter_map_keys = 1
let g:gitgutter_override_sign_column_highlight = 1
let g:gitgutter_preview_win_floating = 1
let g:gitgutter_sign_added = '▎'
let g:gitgutter_sign_modified = '▌'
let g:gitgutter_sign_removed = '▏'
let g:gitgutter_sign_removed_first_line = '▔'
let g:gitgutter_sign_modified_removed = '▍'
"highlight the GitGutter 
highlight GitGutterAdd    guifg=#01FF99 ctermfg=2
highlight GitGutterChange guifg=#01FFFF ctermfg=3
highlight GitGutterDelete guifg=#ff2223 ctermfg=1
"nnoremap <LEADER>gf :GitGutterFold<CR>
" nnoremap H :GitGutterPreviewHunk<CR>
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
nmap <leader>hs <Plug>(GitGutterStageHunk)
nmap <leader>hu <Plug>(GitGutterUndoHunk)
nmap <leader>hp <Plug>(GitGutterPreviewHunk)
" Your vimrc
function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}
"}}}

" Plugin-COC{{{
let g:coc_node_path='C:\Program Files (x86)\nodejs\node.exe'
let g:pydiction_location='$VIM\vimfiles\ftplugin\complet-edict'
" auto install extentions 
let g:coc_global_extensions = ['coc-lightbulb','coc-vimlsp','coc-json','coc-tsserver','coc-clangd','coc-python','coc-snippets','coc-calc','coc-explorer','coc-prettier','coc-yank','coc-markdownlint']
set encoding=utf-8
set hidden
set updatetime=200
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
"set signcolumn=number
" coc-highlight 光标悬浮处  高亮
autocmd CursorHold * silent call CocActionAsync('highlight')

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use 'gh' to show documentation in preview window.
nnoremap <silent> <leader>gh :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" GoTo code navigation.
nmap <silent> <leader>go <Plug>(coc-definition)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)
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

"-----------------------------------------------
"2023-08-12 周六 04:23 下午 add coc config
"-----------------------------------------------
" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
" nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
 " nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
" nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
" nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
" nnoremap <silent><nowait> <space>ls  :<C-u>CocList -I symbols<cr>
" Do default action for next item
" nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item
" nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list
" nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
"
"-----------------------------------------------
"Multiple cursors support
hi CocCursorRange guibg=#b16286 guifg=#ebdbb2
" nmap <silent> <C-q> <Plug>(coc-cursors-position)
" nmap <silent> <C-e> <Plug>(coc-cursors-word)
" nmap <silent> <C-e> <Plug>(coc-cursors-word)*
" xmap <silent> <C-e> y/\V<C-r>=escape(@",'/\')<CR><CR>gN<Plug>(coc-cursors-range)gn
" xmap <silent> <C-g> <Plug>(coc-cursors-range)
" " use normal command like `<leader>xi(`
" nmap <leader>x  <Plug>(coc-cursors-operator)
"---------------------------------------------------
"
"coc-calc
"
"" append result on current expression
" nmap <Leader>ca <Plug>(coc-calc-result-append)
" replace result on current expression
" nmap <Leader>cr <Plug>(coc-calc-result-replace)
"
"coc-explorer
"
nnoremap <leader>nt :CocCommand explorer<CR>
cnoremap Ex :CocCommand explorer<Space>
" 
" coc-prettier
"
vmap <leader>l  <Plug>(coc-format-selected)
cnoremap fmt Prettier<CR>
"
" }}} 

" Plugin-vim-airline {{{
let g:airline_powerline_fonts = 1
" }}}

" Plugin-vim-cpp-enhanced-highlight {{{
let g:cpp_experimental_template_highlight = 1
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 0
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1

let g:lsp_cxx_hl_use_text_props = 1
" }}}

" Plugin-Taglist {{{
nnoremap <leader>ll :TagbarToggle<cr>
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
let g:mdip_imgdir_absolute = '.'
let g:mdip_imgname = 'md_image'
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

" Plugin-vim-Floaterm{{{
" Configuration example
nnoremap   <silent>   <leader>cmd    :FloatermNew<CR>
tnoremap   <silent>   <F8>    <C-\><C-n>:FloatermPrev<CR>
tnoremap   <silent>   <F9>    <C-\><C-n>:FloatermNext<CR>
nnoremap   <silent>   <F11>   :FloatermToggle<CR>
nnoremap   <silent>   <A-F11>   :FloatermKill<CR>
tnoremap   <silent>   <F11>   <C-\><C-n>:FloatermToggle<CR>
"""}}}

" Plugin-Markdown {{{
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0
"autocmd FileType markdown nmap <F5> :MarkdownPreview<CR>
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
" let g:mkdp_browser = 'edge'
" let g:mkdp_browser = 'chrome'

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

"Plugin vim-lsp{{{
if executable('pylsp')
    " pip install python-lsp-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pylsp',
        \ 'cmd': {server_info->['pylsp']},
        \ 'allowlist': ['python'],
        \ })
endif
" consider to config <leader>+key
" ----------2023-08-17 周四 09:43 下午
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> gh <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
"
"}}}

" Plugin-vim-visual-multi{{{
" select words with Ctrl-N 
" create cursor vertical with ctrl-Down
" press n/N to get next/previous occurrence
" press [ / ] to select next/previous cursor
nmap \\ <plug>(VM-Add-Cursor-At-Pos)
nmap <C-e> <plug>(VM-Find-Word)
"
" }}}

" Plugin-nerdtree{{{ 
" nnoremap <leader>nt :call OpenCurrentDir()<CR>
" function! OpenCurrentDir()
"   execute "NERDTreeToggle"
"   execute "NERDTreeRefreshRoot"
" endfunction
" let NERDTreeShowBookmarks=1
" let NERDTreeShowHidden=1
" let NERDTreeWinPos="left"
" autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
" nnoremap <leader>ntf :NERDTreeRefreshRoot<CR>
" let g:NERDTreeGitStatusIndicatorMapCustom = {
"                 \ 'Modified'  :'✹',
"                 \ 'Staged'    :'✚',
"                 \ 'Untracked' :'✭',
"                 \ 'Renamed'   :'➜',
"                 \ 'Unmerged'  :'═',
"                 \ 'Deleted'   :'❌',
"                 \ 'Dirty'     :'✗',
"                 \ 'Ignored'   :'☒',
"                 \ 'Clean'     :'✔︎',
"                 \ 'Unknown'   :'?',
"                 \ }
"}}}

"Calender{{{
let g:calendar_diary = "D:/0-ROGAR/3-Code/0-Notes/diary"  " 设置日记的存储路径
let g:calendar_monday = 1           " 以星期一为开始
let g:calendar_focus_today = 1      " 光标在当天的日期上
let g:calendar_mark = 'right'
noremap <leader>date :Calendar<cr> 
let g:calendar_datetime = 'title'
"}}}

"WebdevIcons{{{
let g:webdevicons_enable_airline_statusline = 1
" loading the plugin
let g:webdevicons_enable = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:webdevicons_enable_nerdtree = 1
"}}}
" ------------------------------------------------------------------------
"------------------------------GENERAL SETTING----------------------------
" ------------------------------------------------------------------------
" General {{{
set nocompatible
set nobackup
set noswapfile
set history=1024
" silent !mkdir -p $HOME/.config/vim-config/swp
" silent !mkdir -p $HOME/.config/vim-config/backup
" silent !mkdir -p $HOME/.config/vim-config/un
" silent !mkdir -p $HOME/.config/vim-config/sessions
"set directory=$HOME/.config/vim-config/swp
"set backupdir=$HOME/.config/vim-config/backup
set undodir=$HOME/.config/vim-config/un
set autochdir
set whichwrap=b,s,<,>,[,]
set nobomb
set backspace=indent,eol,start whichwrap+=<,>,[,]
set wildmenu
set noshowmode
" Vim 的默认寄存器和系统剪贴板共享
set clipboard+=unnamed
"" 设置 alt 键不映射到菜单栏
set winaltkeys=no
"
" Theme
" colorscheme snazzy
" colorscheme neodark
colorscheme onedark
syntax on
let g:python_highlight_all = 1
set nocursorline
set hlsearch
set number
set relativenumber
set scrolloff=4
" 窗口大小
set lines=41 columns=120
" 分割出来的窗口位于当前窗口下边/右
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
set guifont=JetBrainsMono_NF:h13:cANSI
set guifontwide=黑体:h15:cGB2312
" set guifont=Hack_Nerd_Font_Mono:h12:cANSI
" NOTE: Don't wanna to change the font of Chinese, Cause of that VIM8 had not support the Feature, But  you can download SrcCode to Compile the new version. 
set autoindent
set smartindent
set smartcase
set tabstop=4
"set expandtab
set shiftwidth=2
set softtabstop=4
set foldmethod=indent
syntax on
filetype indent plugin on
" vim 文件折叠方式为 marker{{{
augroup fmd_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType vim setlocal foldlevel=0
    autocmd FileType python setlocal foldmethod=indent
    autocmd FileType python setlocal foldlevel=3
augroup END
" }}}
" 文件缩进 Indent{{{
augroup idt_vim
    autocmd!
    autocmd FileType verilog setlocal tabstop=4
    autocmd FileType python setlocal tabstop=4
augroup END
" }}}
" 
" ------------------------------------------------------------------------
"------------------------------NORMAL MODE--------------------------------
" ------------------------------------------------------------------------
"""{{{
nmap <leader>s :source $VIM/_vimrc<cr>
nmap <leader>w :w<cr>
nmap <leader>e :e $VIM/_vimrc<cr>
nmap <leader>wq :wq<cr>
nmap <leader>q :q<cr>
nmap <leader>help :help<space>
nmap <leader>r :s//g<left><left>
nmap <leader>sav :saveas<Space>
nmap <leader>reg :reg<cr>
"
"标签页管理 
"
map <space><cr> :nohl<cr>
map <leader>tn :tabnew<cr>
map <leader>tc :tabclose<cr>
map <leader>th :tabpre<cr>
map <leader>tl :tabnext<cr>
map <leader>to :tabonly<cr>
"
" 分割窗口管理
"
noremap <leader>sl :set splitright<CR>:vsplit<CR>
noremap <leader>sh :set nosplitright<CR>:vsplit<CR>
noremap <leader>sk :set nosplitbelow<CR>:split<CR>
noremap <leader>sj :set splitbelow<CR>:split<CR>
"
" session management
"
nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSesion<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>
"
" Buf Operate
" 
nmap <leader>bb :buffers<CR>
nmap <leader>bn :bnext<CR>
nmap <leader>bp :bprevious<CR>
nmap <leader>bf :bfirst<CR>
nmap <leader>bl :blast<CR>
nmap <leader>b :b
" 设置切换Buffer快捷键"
nnoremap <C-left> :bn<CR>
nnoremap <C-right> :bp<CR>
nnoremap <S-l> :bprevious<CR>
nnoremap <S-h> :bnext<CR>
" nmap <S-l> :WintabsNext<CR>
" nmap <S-h> :WintabsPrevious<CR>
"
"
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

" 打开当前目录 windows
map <leader>ex :!start explorer %:p:h<CR>
 
" 打开当前目录CMD
"map <leader>cmd :!start<cr>
" 打印当前时间
map <F3> a<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
" 复制当前文件/路径到剪贴板
nmap <leader>yfn :let @*=substitute(expand("%"), "/", "\\", "g")<CR>
nmap <leader>yfp :let @*=substitute(expand("%:p"), "/", "\\", "g")<CR>
" 设置行号显示 
nnoremap <F2> :setlocal relativenumber!<cr>
"选择当前行 
nnoremap vv ^vg_
" 重复上次操作
nnoremap U <C-r>
nnoremap <C-a> ggvG$

"""}}}
" -----------------------------------------------------------------------
"-------------------------------INSERT MODE-------------------------------
" ------------------------------------------------------------------------
"""{{{
" 插入模式移动光标 alt + 方向键
inoremap <M-j> <Down>
inoremap <M-k> <Up>
inoremap <M-h> <left>
inoremap <M-l> <Right>
inoremap jj <Esc>
inoremap kk <Esc>
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
"""}}}
" ------------------------------------------------------------------------
"------------------------------VISUAL MODE---------------------------------
"""{{{
vmap <C-c> "+y
vnoremap <BS> d
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y 
vnoremap  w aw
vnoremap  J :move '>+1<CR>gv=gv
vnoremap  K :move '<-2<CR>gv=gv
"""}}}
" ------------------------------------------------------------------------
" --------------------------COMMAND MODE----------------------------------
" ------------------------------------------------------------------------
"""{{{
map <S-Insert>		"+gP
" 命令模式下的行首尾
cnoremap <C-a> <home>
cnoremap <C-e> <end>
cmap <C-v>		<C-R>+
cmap <S-Insert>		<C-R>+ 
" 常规操作-复制、黏贴、选择 CO/PY CUT PASTE SELETED
exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']
"
" set hex edit mode
"
cnoremap hex %!xxd<cr>
" cnoremap dishex %!xxd -r<cr>


nmap <F4> :call CodeFormatter()<CR>
func! CodeFormatter()
        exec "w"
        if &filetype == 'markdown'
                exec "TableFormat"
                " exec "MarkdownPreview"
        endif
endfunc
"""}}}
"============================ Necessary Commands to Execute ====================
exec "nohlsearch"
exec "cd D:/0-ROGAR/3-Code/0-Notes/gvim-craft/"

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

" C {{{
autocmd BufNewFile *.c 0r $VIM\vimfiles\template\c.tpl
autocmd filetype c highlight cNumber guifg=#FFE920
autocmd filetype c highlight cString gui=Italic guifg=#C17753
autocmd filetype c highlight cInclude gui=Italic guifg=#CB59E8
autocmd filetype c highlight cDefine guifg=#FF7DFF
autocmd filetype c highlight Conditional guifg=#D881ED
autocmd filetype c highlight cBoolean guifg=#E37795
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
""" }}}
 
" LUA{{{
autocmd BufNewFile *.lua 0r $VIM\vimfiles\template\lua.tpl
"""}}}

"Shell {{{
autocmd BufNewFile *.sh 0r $VIM\vimfiles\template\shell.tpl
autocmd BufNewFile *.bash 0r $VIM\vimfiles\template\shell.tpl
" }}}

""verilog{{{

autocmd BufNewFile *.v 0r $VIM\vimfiles\template\verilog.tpl
" }}}
" 

"""{{{
" vim -b : edit binary using xxd-format!
  " augroup Binary
  "   au!
  "   au BufReadPre  *.bin let &bin=1
  "   au BufReadPost *.bin if &bin | %!xxd
  "   au BufReadPost *.bin set ft=xxd | endif
  "   au BufWritePre *.bin if &bin | %!xxd -r
  "   au BufWritePre *.bin endif
  "   au BufWritePost *.bin if &bin | %!xxd
  "   au BufWritePost *.bin set nomod | endif
  " augroup END
"""}}}
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" 操作技巧{{{
"""Normal Mode
" :数字     --跳转到该行
" 数字%     --跳转到百分比位置
" gE        --回到上一个单词
" gU		--Uppercase the selected word/paragragh
" gu		--Lowercase the selected word/paragragh
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
"I	列块插入	先用Ctrl+V选定块|v_b_I|
"A	列块添加	先用Ctrl+V选定块|v_b_A|
":verbose map <key> 查看key的映射位置
"
":command    查看所有用户自定义命令
"文本排版
" center   居中
" left     靠左
" right    靠右
"
":term bash 打开bash终端可以运行shell程序；
":term 直接打开windows终端
" <leader>c<space> NERDCommenterToggle
"
"
":!%xxd 切换到十六进制模式显示
"%!”为调用第三方操作对vim内容进行操作，
"如 :%!tr a-z A-Z 把全文小写字母改成大写
"
"Substitute-替换 {{{
"在VIM中进行文本替换：
   "
    " 1.  替换当前行中的内容：    :s/from/to/    （s即substitude）
    "     :s/from/to/     ：  将当前行中的第一个from，替换成to。如果当前行含有多个
    "                         from，则只会替换其中的第一个。
    "     :s/from/to/g    ：  将当前行中的所有from都替换成to。
    "     :s/from/to/gc   ：  将当前行中的所有from都替换成to，但是每一次替换之前都
    "                         会询问请求用户确认此操作。
   "
    "     注意：这里的from和to都可以是任何字符串，其中from还可以是正则表达式。
   "
    " 2.  替换某一行的内容：      :33s/from/to/g
    "     :.s/from/to/g   ：  在当前行进行替换操作。
    "     :33s/from/to/g  ：  在第33行进行替换操作。
    "     :$s/from/to/g   ：  在最后一行进行替换操作。
   "
    " 3.  替换某些行的内容：      :10,20s/from/to/g
    "     :10,20s/from/to/g   ：  对第10行到第20行的内容进行替换。
    "     :1,$s/from/to/g     ：  对第一行到最后一行的内容进行替换（即全部文本）。
    "     :1,.s/from/to/g     ：  对第一行到当前行的内容进行替换。
    "     :.,$s/from/to/g     ：  对当前行到最后一行的内容进行替换。
    "     :'a,'bs/from/to/g   ：  对标记a和b之间的行（含a和b所在的行）进行替换。
    "                             其中a和b是之前用m命令所做的标记。
   "
    " 4.  替换所有行的内容：      :%s/from/to/g
    "     :%s/from/to/g   ：  对所有行的内容进行替换。
   "
    " 5.  替换命令的完整形式：    :[range]s/from/to/[flags]
    "     5.1 s/from/to/
    "         把from指定的字符串替换成to指定的字符串，from可以是正则表达式。
    "     5.2 [range]
    "         有以下一些表示方法：
    "         不写range   ：  默认为光标所在的行。
    "         .           ：  光标所在的行。
    "         1           ：  第一行。
    "         $           ：  最后一行。
    "         33          ：  第33行。
    "         'a          ：  标记a所在的行（之前要使用ma做过标记）。
    "         .+1         ：  当前光标所在行的下面一行。
    "         $-1         ：  倒数第二行。（这里说明我们可以对某一行加减某个数值来
    "                         取得相对的行）。
    "         22,33       ：  第22～33行。
    "         1,$         ：  第1行 到 最后一行。
    "         1,.         ：  第1行 到 当前行。
    "         .,$         ：  当前行 到 最后一行。
    "         'a,'b       ：  标记a所在的行 到 标记b所在的行。
   "
    "         %           ：  所有行（与 1,$ 等价）。
   "
    "         ?chapter?   ：  从当前位置向上搜索，找到的第一个chapter所在的行。（
    "                         其中chapter可以是任何字符串或者正则表达式。
    "         /chapter/   ：  从当前位置向下搜索，找到的第一个chapter所在的行。（
    "                         其中chapter可以是任何字符串或者正则表达式。
   "
    "         注意，上面的所有用于range的表示方法都可以通过 +、- 操作来设置相对偏
    "         移量。
   "
    "     5.3 [flags]
    "         这里可用的flags有：
   "
    "         无      ：  只对指定范围内的第一个匹配项进行替换。
    "         g       ：  对指定范围内的所有匹配项进行替换。
    "         c       ：  在替换前请求用户确认。
    "         e       ：  忽略执行过程中的错误。
   "
    "         注意：上面的所有flags都可以组合起来使用，比如 gc 表示对指定范围内的
    "         所有匹配项进行替换，并且在每一次替换之前都会请用户确认。
" }}}
"
"}}}
"
"
