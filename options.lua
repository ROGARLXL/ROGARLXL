--[[
  文件名: options.lua
  用途: Neovim 编辑器选项配置
  依赖: 无

  修改指导:
  1. 取消注释(删除 --)来启用配置项
  2. 修改配置项的值来调整行为
  3. 修改后使用 :source % 重新加载

  常见修改场景:
  - 修改缩进宽度: 取消注释 tabstop 和 shiftwidth
  - 开启/关闭行号: 取消注释 number 或 relativenumber
  - 修改配色: 参见 colorscheme.lua

  验证方法:
  1. 使用 :set 查看当前配置
  2. 使用 :lua print(vim.opt.<option>:get()) 查看选项值
  3. 重启 Neovim 检查配置是否生效

  问题排查:
  - 配置未生效: 检查语法,使用 :source % 重新加载
  - 选项冲突: 某些选项可能相互冲突,需要调整
]]

local options = {
  -- ==================== 编码设置 ====================
  encoding = "utf-8",                    -- 内部编码
  fileencoding = "utf-8",                -- 文件编码
  -- fileencodings = "utf-8,gbk,gb18030,cp936",  -- 文件编码列表(多编码支持)

  -- ==================== 显示设置 ====================
  number = true,                         -- 显示行号
  relativenumber = true,                 -- 显示相对行号
  -- numberwidth = 4,                    -- 行号宽度
  -- signcolumn = "yes",                  -- 显示符号列
  -- cursorline = true,                   -- 高亮当前行
  -- cursorcolumn = false,                -- 高亮当前列
  -- colorcolumn = "80",                  -- 在指定列显示竖线
  -- wrap = false,                        -- 不自动换行
  -- linebreak = true,                    -- 智能换行
  -- showbreak = "↪ ",                   -- 换行提示符
  -- showmode = true,                     -- 显示模式
  -- showcmd = true,                      -- 显示命令
  -- shortmess = "filnxtToOFWIc",         -- 短消息格式
  -- laststatus = 2,                      -- 始终显示状态栏
  -- ruler = true,                        -- 显示光标位置
  -- wildmenu = true,                     -- 增强命令补全
  -- wildmode = "longest:full,full",      -- 补全模式
  -- pumheight = 10,                      -- 补全菜单高度
  -- conceallevel = 0,                    -- 隐藏级别
  -- cmdheight = 1,                       -- 命令行高度

  -- ==================== 搜索设置 ====================
  hlsearch = true,                       -- 高亮搜索结果
  incsearch = true,                      -- 增量搜索
  ignorecase = true,                     -- 忽略大小写
  smartcase = true,                      -- 智能大小写
  -- magic = true,                        -- 使用正则表达式
  -- wrapscan = true,                     -- 搜索循环
  -- inccommand = "nosplit",              -- 增量显示替换命令

  -- ==================== 缩进设置 ====================
  tabstop = 2,                          -- Tab 宽度
  shiftwidth = 2,                       -- 自动缩进宽度
  expandtab = true,                     -- Tab 转空格
  smartindent = true,                   -- 智能缩进
  autoindent = true,                    -- 自动缩进
  -- softtabstop = 2,                     -- 软 Tab 宽度
  -- shiftround = false,                  -- 缩进对齐
  -- cindent = false,                     -- C 缩进
  -- cinoptions = "",                     -- C 缩进选项

  -- ==================== 编辑设置 ====================
  -- hidden = true,                       -- 允许隐藏未保存的缓冲区
  -- backup = false,                      -- 不创建备份文件
  -- writebackup = false,                 -- 写入前不备份
  -- swapfile = false,                    -- 不使用交换文件
  -- undofile = true,                     -- 持久化撤销
  -- undolevels = 10000,                  -- 撤销级别
  -- backupdir = "",                      -- 备份目录
  -- directory = "",                      -- 交换文件目录
  -- undodir = "",                        -- 撤销文件目录
  -- updatecount = 0,                     -- 不写入交换文件
  -- updatetime = 300,                    -- 更新时间
  -- timeoutlen = 500,                    -- 键序列超时
  -- ttimeoutlen = 10,                    -- 键码超时
  -- modeline = false,                    -- 不处理模式行
  -- modelines = 5,                       -- 模式行数量

  -- ==================== 鼠标和剪贴板 ====================
  mouse = "a",                           -- 启用鼠标
  -- mousescroll = "ver:3,hor:6",         -- 鼠标滚动
  -- mousefocus = false,                  -- 鼠标焦点
  -- selectmode = "",                     -- 选择模式
  -- clipboard = "unnamed,unnamedplus",   -- 使用系统剪贴板
  -- clipboard = "unnamedplus",            -- 使用 + 寄存器

  -- ==================== 窗口和分割 ====================
  splitbelow = true,                     -- 水平分割在下方
  splitright = true,                     -- 垂直分割在右侧
  -- equalalways = true,                  -- 等宽窗口
  -- winfixwidth = false,                 -- 固定窗口宽度
  -- winfixheight = false,                -- 固定窗口高度
  -- winminwidth = 0,                     -- 最小窗口宽度
  -- winminheight = 0,                    -- 最小窗口高度
  -- scroll = 0,                           -- 滚动偏移
  -- scrolloff = 8,                       -- 滚动偏移
  -- sidescrolloff = 8,                   -- 侧边滚动偏移

  -- ==================== 补全设置 ====================
  completeopt = { "menu", "menuone", "noselect" },  -- 补全选项
  -- complete = ".",                      -- 补全模式
  -- pumwidth = 0,                        -- 补全菜单宽度
  -- wildignore = "",                     -- 忽略文件
  -- wildignorecase = true,               -- 忽略大小写

  -- ==================== 终端设置 ====================
  -- termguicolors = true,                 -- 真彩色支持
  -- shell = "",                          -- Shell 程序
  -- shellcmdflag = "",                   -- Shell 参数
  -- shellquote = "",                     -- Shell 引用
  -- shellxquote = "",                    -- Shell 转义
  -- shellslash = false,                  -- Shell 斜杠
  -- shellredir = "",                     -- Shell 重定向
  -- shellpipe = "",                      -- Shell 管道
  -- shelltemp = true,                    -- Shell 临时文件

  -- ==================== 拼写检查 ====================
  -- spell = false,                       -- 拼写检查
  -- spelllang = "en",                    -- 拼写语言
  -- spellfile = "",                      -- 拼写文件
  -- spelloptions = "",                   -- 拼写选项

  -- ==================== 折叠设置 ====================
  -- foldenable = true,                   -- 启用折叠
  -- foldmethod = "manual",               -- 折叠方法
  -- foldlevel = 0,                       -- 折叠级别
  -- foldlevelstart = -1,                 -- 初始折叠级别
  -- foldcolumn = "0",                    -- 折叠列
  -- foldtext = "",                       -- 折叠文本
  -- foldopen = "all",                    -- 自动打开折叠
  -- foldclose = "all",                   -- 自动关闭折叠

  -- ==================== diff 设置 ====================
  -- diff = false,                        -- 差异模式
  -- diffopt = "internal,filler,closeoff",  -- 差异选项
  -- diffexpr = "",                      -- 差异表达式
  -- patchexpr = "",                     -- 补丁表达式
  -- patchmode = 0,                      -- 补丁模式

  -- ==================== 网络和代理 ====================
  -- netrw_browse_split = 0,             -- 网络浏览分割
  -- netrw_winsize = 25,                 -- 网络浏览窗口大小
  -- netrw_liststyle = 3,                -- 网络列表样式
  -- netrw_list_hide = "",               -- 网络隐藏列表
  -- netrw_hide = 0,                     -- 网络隐藏

  -- ==================== 性能设置 ====================
  -- lazyredraw = false,                  -- 延迟重绘
  -- synmaxcol = 3000,                    -- 最大语法列
  -- regex = 1,                          -- 正则表达式引擎
  -- regexpengine = 0,                   -- 正则表达式引擎
  -- re = 0,                             -- 正则表达式引擎

  -- ==================== 其他设置 ====================
  -- virtualedit = "",                    -- 虚拟编辑
  -- whichwrap = "",                     -- 光标换行
  -- startofline = true,                 -- 移动到行首
  -- virtualedit = "block",              -- 虚拟块编辑
  -- timeout = true,                     -- 超时
  -- ttimeout = true,                    -- 键码超时
  -- history = 50,                       -- 历史记录
  -- keywordprg = "",                    -- 关键字帮助程序
  -- formatoptions = "",                 -- 格式选项
  -- formatlistpat = "",                 -- 列表模式
  -- formatexpr = "",                    -- 格式表达式
  -- infercase = false,                  -- 推断大小写
  -- iskeyword = "",                     -- 关键字字符
  -- joinspaces = false,                  -- 连接空格
  -- nrformats = "octal,hex",            -- 数字格式
  -- sessionoptions = "",                -- 会话选项
  -- viewoptions = "",                   -- 视图选项
  -- viminfo = "",                       -- Vim 信息
  -- tags = "",                          -- 标签文件
  -- tagstack = true,                    -- 标签栈
  -- switchbuf = "",                     -- 缓冲区切换
  -- showfulltag = false,                -- 显示完整标签
  -- grepformat = "",                    -- Grep 格式
  -- grepprg = "",                       -- Grep 程序
  -- errorformat = "",                   -- 错误格式
  -- makeprg = "",                       -- Make 程序
  -- shellpipe = "",                     -- Shell 管道
  -- shellredir = "",                    -- Shell 重定向
  -- equalprg = "",                      -- 等号程序
  -- paragraph = "",                     -- 段落定义
  -- sections = "",                      -- 节定义
  -- dictionary = "",                    -- 字典文件
  -- thesaurus = "",                     -- 同义词库
  -- complete = "",                      -- 补全模式
}

-- 应用配置
for option, value in pairs(options) do
  vim.opt[option] = value
end

-- ==================== 全局变量设置 ====================
local globals = {
  -- mapleader = " ",                    -- Leader 键
  -- maplocalleader = ",",               -- Local Leader 键
  -- loaded_netrw = 1,                   -- 禁用 netrw
  -- loaded_netrwPlugin = 1,             -- 禁用 netrw 插件
  -- python3_host_prog = "",             -- Python3 程序
  -- python_host_prog = "",              -- Python 程序
  -- node_host_prog = "",                -- Node 程序
  -- ruby_host_prog = "",                -- Ruby 程序
  -- perl_host_prog = "",                -- Perl 程序
  -- loaded_perl_provider = 0,           -- 禁用 Perl
  -- loaded_ruby_provider = 0,           -- 禁用 Ruby
  -- loaded_python3_provider = 0,       -- 禁用 Python3
  -- loaded_python_provider = 0,         -- 禁用 Python
  -- loaded_node_provider = 0,           -- 禁用 Node

  -- Neovide 特定设置
  -- neovide_cursor_vfx_mode = "railgun",  -- 光标效果
  -- neovide_transparency = 0.8,            -- 透明度
  -- neovide_floating_blur_amount_x = 2.0,  -- 浮动窗口模糊
  -- neovide_floating_blur_amount_y = 2.0,
}

for global, value in pairs(globals) do
  vim.g[global] = value
end

print("✅ 编辑器选项配置已加载")
