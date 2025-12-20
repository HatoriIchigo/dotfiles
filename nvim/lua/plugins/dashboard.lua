-------------------------------------------------------
---
---                  util
---
-------------------------------------------------------
return {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        -- Buttons
        dashboard.section.buttons.val = {
            dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
            dashboard.button("r", "  Recently opened files", ":Telescope oldfiles<CR>"),
            dashboard.button("p", "  Recent projects", ":Telescope projects<CR>"), -- ← project.nvim 連携
            dashboard.button("n", "  New file", ":ene <BAR> startinsert<CR>"),
            dashboard.button("q", "  Quit", ":qa<CR>"),
        }

        -- setup
        alpha.setup(dashboard.config)
    end
}
