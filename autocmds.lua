[
  文件名: autocmds.lua
  用途: Neovim 自动命令配置
  依赖: 无

  修改指导:
  1. 使用 vim.api.nvim_create_autocmd 创建自动命令
  2. 指定事件、模式和回调函数
  3. 修改后使用 :source % 重新加载

  添加新自动命令示例:
  vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*.lua",
    callback = function()
      -- 你的代码
    end,
  })

  常用事件:
  - BufWritePre: 保存前
  - BufReadPost: 读取后
  - BufEnter: 进入缓冲区
  - FileType: 检测到文件类型
  - VimEnter: Vim 启动
  - CursorHold: 光标停留

  验证方法:
  1. 使用 :autocmd 查看所有自动命令
  2. 测试自动命令是否触发
  3. 使用 :verbose autocmd <event> 查看详细信息
]]

-- 创建自动命令组
local autocmds = {
  -- ==================== 文件操作 ====================
  {
    event = "BufWritePre",
    pattern = "*",
    desc = "删除行尾空格",
    callback = function()
      vim.cmd([[%s/\s\+$//e]])
    end,
  },

  {
    event = "BufWritePre",
    pattern = "*",
    desc = "自动创建目录",
    callback = function()
      local dir = vim.fn.expand("<afile>:p:h")
      if vim.fn.isdirectory(dir) == 0 then
        vim.fn.mkdir(dir, "p")
      end
    end,
  },

  {
    event = "FocusLost",
    pattern = "*",
    desc = "焦点丢失时自动保存",
    callback = function()
      if vim.fn.expand("%:t") ~= "" then
        vim.cmd("silent! w")
      end
    end,
  },

  -- ==================== 光标操作 ====================
  {
    event = "TextYankPost",
    pattern = "*",
    desc = "高亮 yanked 文本",
    callback = function()
      vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
    end,
  },

  {
    event = "CursorHold",
    pattern = "*",
    desc = "光标停留时更新诊断信息",
    callback = function()
      -- 可以在这里添加 LSP 相关的更新逻辑
    end,
  },

  -- ==================== 文件类型特定设置 ====================
  {
    event = "FileType",
    pattern = "lua",
    desc = "Lua 文件特定设置",
    callback = function()
      vim.opt_local.shiftwidth = 2
      vim.opt_local.tabstop = 2
      vim.opt_local.expandtab = true
    end,
  },

  {
    event = "FileType",
    pattern = "python",
    desc = "Python 文件特定设置",
    callback = function()
      vim.opt_local.shiftwidth = 4
      vim.opt_local.tabstop = 4
      vim.opt_local.expandtab = true
      vim.opt_local.textwidth = 88
    end,
  },

  {
    event = "FileType",
    pattern = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
    desc = "JavaScript/TypeScript 文件特定设置",
    callback = function()
      vim.opt_local.shiftwidth = 2
      vim.opt_local.tabstop = 2
      vim.opt_local.expandtab = true
    end,
  },

  {
    event = "FileType",
    pattern = "markdown",
    desc = "Markdown 文件特定设置",
    callback = function()
      vim.opt_local.wrap = true
      vim.opt_local.linebreak = true
      vim.opt_local.spell = true
      vim.opt_local.textwidth = 80
    end,
  },

  {
    event = "FileType",
    pattern = "verilog",
    desc = "Verilog 文件特定设置",
    callback = function()
      vim.opt_local.shiftwidth = 4
      vim.opt_local.tabstop = 4
      vim.opt_local.expandtab = false
    end,
  },

  {
    event = "FileType",
    pattern = "go",
    desc = "Go 文件特定设置",
    callback = function()
      vim.opt_local.shiftwidth = 4
      vim.opt_local.tabstop = 4
      vim.opt_local.expandtab = false
      vim.opt_local.noexpandtab = true
    end,
  },

  {
    event = "FileType",
    pattern = "make",
    desc = "Makefile 文件特定设置",
    callback = function()
      vim.opt_local.shiftwidth = 4
      vim.opt_local.tabstop = 4
      vim.opt_local.expandtab = false
      vim.opt_local.noexpandtab = true
    end,
  },

  {
    event = "FileType",
    pattern = { "c", "cpp" },
    desc = "C/C++ 文件特定设置",
    callback = function()
      vim.opt_local.shiftwidth = 4
      vim.opt_local.tabstop = 4
      vim.opt_local.expandtab = false
      vim.opt_local.noexpandtab = true
    end,
  },

  {
    event = "FileType",
    pattern = { "sh", "bash", "zsh" },
    desc = "Shell 文件特定设置",
    callback = function()
      vim.opt_local.shiftwidth = 2
      vim.opt_local.tabstop = 2
      vim.opt_local.expandtab = true
    end,
  },

  {
    event = "FileType",
    pattern = { "html", "css", "scss", "less" },
    desc = "Web 文件特定设置",
    callback = function()
      vim.opt_local.shiftwidth = 2
      vim.opt_local.tabstop = 2
      vim.opt_local.expandtab = true
    end,
  },

  {
    event = "FileType",
    pattern = { "yaml", "yml" },
    desc = "YAML 文件特定设置",
    callback = function()
      vim.opt_local.shiftwidth = 2
      vim.opt_local.tabstop = 2
      vim.opt_local.expandtab = true
    end,
  },

  {
    event = "FileType",
    pattern = { "json", "jsonc" },
    desc = "JSON 文件特定设置",
    callback = function()
      vim.opt_local.shiftwidth = 2
      vim.opt_local.tabstop = 2
      vim.opt_local.expandtab = true
    end,
  },

  {
    event = "FileType",
    pattern = "rust",
    desc = "Rust 文件特定设置",
    callback = function()
      vim.opt_local.shiftwidth = 4
      vim.opt_local.tabstop = 4
      vim.opt_local.expandtab = true
    end,
  },

  -- ==================== 缓冲区操作 ====================
  {
    event = "BufReadPost",
    pattern = "*",
    desc = "恢复光标位置",
    callback = function()
      local mark = vim.api.nvim_buf_get_mark(0, '"')
      local lcount = vim.api.nvim_buf_line_count(0)
      if mark[1] > 0 and mark[1] <= lcount then
        pcall(vim.api.nvim_win_set_cursor, 0, mark)
      end
    end,
  },

  -- ==================== 窗口操作 ====================
  {
    event = "VimResized",
    pattern = "*",
    desc = "窗口大小改变时重新布局",
    callback = function()
      vim.cmd("wincmd =")
    end,
  },

  -- ==================== 快捷键提示 ====================
  {
    event = "BufWinEnter",
    pattern = "*",
    desc = "显示快捷键提示",
    callback = function()
      -- 可以在这里集成 which-key 或其他快捷键提示插件
    end,
  },

  -- ==================== LSP 相关 ====================
  {
    event = "LspAttach",
    pattern = "*",
    desc = "LSP 连接成功后的设置",
    callback = function(args)
      local bufnr = args.buf
      local opts = { buffer = bufnr }

      -- 跳转到定义
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
      
      -- 查看文档
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)
      
      -- 查找引用
      vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
      vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
      
      -- 代码操作
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      vim.keymap.set("n", "<leader>f", function()
        vim.lsp.buf.format({ async = true })
      end, opts)
      
      -- 诊断信息
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
      vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
    end,
  },

  -- ==================== Git 相关 ====================
  {
    event = "BufReadPost",
    pattern = "*.git/*",
    desc = "Git 相关文件设置",
    callback = function()
      vim.opt_local.filetype = "git"
    end,
  },

  -- ==================== 终端相关 ====================
  {
    event = "TermOpen",
    pattern = "*",
    desc = "终端窗口设置",
    callback = function()
      vim.opt_local.number = false
      vim.opt_local.relativenumber = false
      vim.cmd("startinsert")
    end,
  },

  {
    event = "BufEnter",
    pattern = "term://*",
    desc = "进入终端时自动进入插入模式",
    callback = function()
      vim.cmd("startinsert")
    end,
  },

  -- ==================== 其他 ====================
  {
    event = "VimEnter",
    pattern = "*",
    desc = "Vim 启动时的设置",
    callback = function()
      -- 可以在这里添加启动时的初始化逻辑
      print("🚀 Neovim 启动完成!")
    end,
  },
}

-- 创建所有自动命令
for _, autocmd in ipairs(autocmds) do
  vim.api.nvim_create_autocmd(autocmd.event, {
    pattern = autocmd.pattern,
    desc = autocmd.desc,
    callback = autocmd.callback,
  })
end

print("✅ 自动命令配置已加载")
