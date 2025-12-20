-----------------------------------------------
---
---  　　　　ファイラー系プラグイン
---
-----------------------------------------------
return {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
        default_component_configs = {
            git_status = {
                symbols = {
                    added     = "+",
                    modified  = "~",
                    deleted   = "-",
                    renamed   = "R",
                    untracked = "?",
                    ignored   = "I",
                    unstaged  = "U",
                    staged    = "S",
                    conflict  = "!",
                },
            },
        },
    },
}
