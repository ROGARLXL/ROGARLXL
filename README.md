- 👋 Hi, I’m ROGAR
- 👀 I’m interested in tree
- 🌱 I’m currently learning ...
- 💞️ I’m looking to collaborate on ...
- 📫 How to reach me rogarlxl@outlook.com

<!---
ROGARLXL/ROGARLXL is a ✨ special ✨ repository because its `README.md` (this file) appears on your GitHub profile.
You can click the Preview link to take a look at your changes.
--->


And the Follow is the VScode ==>setting.json
```{"vim.easymotion": true,
    "vim.incsearch": true,
    "vim.useSystemClipboard": true,
    "vim.useCtrlKeys": true,
    "vim.hlsearch": true,
    "vim.insertModeKeyBindings": [
        {
            "before": [
                "l",
                "l"
            ],
            "after": [
                "<Esc>"
            ]
        }
    ],
    "vim.normalModeKeyBindingsNonRecursive": [
        {
          "before": ["<leader>", "d"],
          "after": ["d", "d"]
        },
        {
          "before": ["<C-n>"],
          "commands": [":nohl"]
        },
        {
            "before": [
                "<leader>",
                "m"
            ],
            "commands": [
                "bookmarks.toggle"
            ]
        },
        {
            "before": [
                "<leader>",
                "w",
            ],
            "commands": [
                ":w"
            ]
        },
        {
            "before": [
                "<leader>",
                "b"
            ],
            "commands": [
                "bookmarks.list"
            ]
        }
      ],
    "vim.leader": "<space>",
    "vim.handleKeys": {
        "<C-a>": false,
        "<C-f>": true
    },
  }
