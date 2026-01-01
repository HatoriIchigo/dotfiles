----------------------------------------------
---
---             AI関連プラグイン
---
----------------------------------------------
return {
    "folke/sidekick.nvim",
    opts = {
        cli = {
            mux = {
                enabled = true,
                backend = "tmux",
            }
        }
    }
}
