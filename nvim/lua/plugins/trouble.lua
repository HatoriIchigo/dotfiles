------------------------------------------------
---
---            警告、エラーなどを表示
---
------------------------------------------------
return {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    lazy = false,
    config = function()
        require("trouble").setup({})
    end
}
