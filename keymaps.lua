[
  文件名: keymaps.lua
  用途: Neovim 快捷键映射配置
  依赖: 无

  修改指导:
  1. 取消注释(删除 --)来启用快捷键
  2. 修改快捷键的映射
  3. 修改后使用 :source % 重新加载

  快捷键冲突检测:
  1. 使用 :map <key> 查看现有映射
  2. 使用 :verbose map <key> 查看详细映射
  3. 使用 lua print(vim.fn.mapcheck('<leader>w', 'n')) 检查冲突

  验证方法:
  1. 按 <leader>h 查看帮助
  2. 测试快捷键是否正常工作
  3. 使用 :map 查看所有快捷键映射

  问题排查:
  - 快捷键不工作: 检查是否有冲突,使用 :verbose map 查看详情
  - leader 键未生效: 检查 g.mapleader 设置
]]

-- ==================== 正常模式快捷键 ====================
local normal_keymaps = {
  -- 文件操作
  ["<leader>w"] = { "<cmd>w<cr>", desc = "保存文件" },
  ["<leader>q"] = { "<cmd>q<cr>", desc = "退出" },
  ["<leader>x"] = { "<cmd>x<cr>", desc = "保存并退出" },
  ["<leader>wq"] = { "<cmd>wq<cr>", desc = "保存并退出" },
  ["<leader>e"] = { "<cmd>e $MYVIMRC<cr>", desc = "编辑配置文件" },
  ["<leader>s"] = { "<cmd>source $MYVIMRC<cr>", desc = "重新加载配置" },
  ["<leader>help"] = { "<cmd>help<space>", desc = "帮助" },
  ["<leader>r"] = { ":s//g<left><left>", desc = "替换" },
  ["<leader>sav"] = { "<cmd>saveas<Space>", desc = "另存为" },
  ["<leader>reg"] = { "<cmd>reg<cr>", desc = "寄存器" },

  -- 搜索
  ["<leader>h"] = { "<cmd>nohlsearch<cr>", desc = "取消高亮" },
  ["<space><cr>"] = { "<cmd>nohlsearch<cr>", desc = "取消高亮" },

  -- 窗口操作
  ["<leader>v"] = { "<cmd>vsplit<cr>", desc = "垂直分割" },
  ["<leader>s"] = { "<cmd>split<cr>", desc = "水平分割" },
  ["<leader>c"] = { "<cmd>close<cr>", desc = "关闭窗口" },
  ["<leader>sl"] = { "<cmd>set splitright<CR>:vsplit<CR>", desc = "右垂直分割" },
  ["<leader>sh"] = { "<cmd>set nosplitright<CR>:vsplit<CR>", desc = "左垂直分割" },
  ["<leader>sk"] = { "<cmd>set nosplitbelow<CR>:split<CR>", desc = "上水平分割" },
  ["<leader>sj"] = { "<cmd>set splitbelow<CR>:split<CR>", desc = "下水平分割" },

  -- 窗口导航
  ["<C-h>"] = { "<C-w>h", desc = "移动到左侧窗口" },
  ["<C-j>"] = { "<C-w>j", desc = "移动到下方窗口" },
  ["<C-k>"] = { "<C-w>k", desc = "移动到上方窗口" },
  ["<C-l>"] = { "<C-w>l", desc = "移动到右侧窗口" },

  -- 窗口大小调整
  ["<M-k>"] = { "<cmd>resize +5<cr>", desc = "增加窗口高度" },
  ["<M-j>"] = { "<cmd>resize -5<cr>", desc = "减少窗口高度" },
  ["<M-l>"] = { "<cmd>vertical resize -5<cr>", desc = "减少窗口宽度" },
  ["<M-h>"] = { "<cmd>vertical resize +5<cr>", desc = "增加窗口宽度" },

  -- 缓冲区操作
  ["<leader>bb"] = { "<cmd>buffers<cr>", desc = "列出缓冲区" },
  ["<leader>bn"] = { "<cmd>bnext<cr>", desc = "下一个缓冲区" },
  ["<leader>bp"] = { "<cmd>bprevious<cr>", desc = "上一个缓冲区" },
  ["<leader>bf"] = { "<cmd>bfirst<cr>", desc = "第一个缓冲区" },
  ["<leader>bl"] = { "<cmd>blast<cr>", desc = "最后一个缓冲区" },
  ["<leader>b"] = { "<cmd>b", desc = "切换缓冲区" },
  ["<C-left>"] = { "<cmd>bnext<cr>", desc = "下一个缓冲区" },
  ["<C-right>"] = { "<cmd>bprevious<cr>", desc = "上一个缓冲区" },
  ["<S-l>"] = { "<cmd>bprevious<cr>", desc = "上一个缓冲区" },
  ["<S-h>"] = { "<cmd>bnext<cr>", desc = "下一个缓冲区" },

  -- 标签页操作
  ["<leader>tn"] = { "<cmd>tabnew<cr>", desc = "新建标签页" },
  ["<leader>tc"] = { "<cmd>tabclose<cr>", desc = "关闭标签页" },
  ["<leader>th"] = { "<cmd>tabpre<cr>", desc = "上一个标签页" },
  ["<leader>tl"] = { "<cmd>tabnext<cr>", desc = "下一个标签页" },
  ["<leader>to"] = { "<cmd>tabonly<cr>", desc = "只显示当前标签页" },

  -- 文件路径复制
  ["<leader>yfn"] = { ":let @*=substitute(expand(\"%\"), \"/\", \"\\\\\", \"g\")<cr>", desc = "复制文件名" },
  ["<leader>yfp"] = { ":let @*=substitute(expand(\"%:p\"), \"/\", \"\\\\\", \"g\")<cr>", desc = "复制文件路径" },

  -- 其他
  ["<leader>."] = { "<cmd>cd %:p:h<cr>", desc = "切换到当前文件目录" },
  ["<F2>"] = { "<cmd>setlocal relativenumber!<cr>", desc = "切换相对行号" },
  ["vv"] = { "^vg_", desc = "选中整行" },
  ["U"] = { "<C-r>", desc = "重做" },
  ["<C-a>"] = { "ggvG$", desc = "全选" },
  ["E"] = { "$", desc = "行尾" },
  ["W"] = { "^", desc = "行首" },

  -- Git 操作 (需要 fugitive 插件)
  -- ["<leader>git"] = { "<cmd>Git<cr>", desc = "Git 命令" },

  -- 文件树 (nvim-tree)
  ["<leader>o"] = { "<cmd>NvimTreeFocus<cr>", desc = "聚焦文件树" },
  ["<leader>f"] = { "<cmd>NvimTreeFindFile<cr>", desc = "在文件树中查找文件" },
}

-- 应用正常模式快捷键
for key, mapping in pairs(normal_keymaps) do
  vim.keymap.set("n", key, mapping[1], { desc = mapping.desc, silent = true })
end

-- ==================== 可视模式快捷键 ====================
local visual_keymaps = {
  -- 缩进
  ["<"] = { "<gv", desc = "向左缩进" },
  [">"] = { ">gv", desc = "向右缩进" },

  -- 移动
  ["J"] = { ":m '>+1<CR>gv=gv", desc = "向下移动行" },
  ["K"] = { ":m '<-2<CR>gv=gv", desc = "向上移动行" },
}

-- 应用可视模式快捷键
for key, mapping in pairs(visual_keymaps) do
  vim.keymap.set("v", key, mapping[1], { desc = mapping.desc, silent = true })
end

-- ==================== 插入模式快捷键 ====================
local insert_keymaps = {
  -- 快速退出
  ["jj"] = { "<esc>", desc = "退出插入模式" },
  ["kk"] = { "<esc>", desc = "退出插入模式" },
  -- 快速移动
  ["<C-h>"] = { "<left>", desc = "向左移动" },
  ["<C-j>"] = { "<down>", desc = "向下移动" },
  ["<C-k>"] = { "<up>", desc = "向上移动" },
  ["<C-l>"] = { "<right>", desc = "向右移动" },
}

-- 应用插入模式快捷键
for key, mapping in pairs(insert_keymaps) do
  vim.keymap.set("i", key, mapping[1], { desc = mapping.desc, silent = true })
end

-- ==================== 命令模式快捷键 ====================
local command_keymaps = {
  -- Git 命令快捷键 (需要 fugitive 插件)
  -- ["ga"] = { "Git add<Space>.", desc = "Git add" },
  -- ["gM"] = { "Git merge master", desc = "Git merge master" },
  -- ["gm"] = { "Git merge<Space>", desc = "Git merge" },
  -- ["gb"] = { "Git branch -a<CR>zn:Git checkout<Space>", desc = "Git branch" },
  -- ["gc"] = { "Git commit -m\"\"<left>", desc = "Git commit" },
  -- ["gu"] = { "Git pull", desc = "Git pull" },
  -- ["gp"] = { "Git push", desc = "Git push" },
}

-- 应用命令模式快捷键
for key, mapping in pairs(command_keymaps) do
  vim.keymap.set("c", key, mapping[1], { desc = mapping.desc })
end

print("✅ 快捷键配置已加载")
