-----------------------------------------------------
---
---     末尾空白をハイライト表示するプラグイン
---
-----------------------------------------------------
return {
    "echasnovski/mini.trailspace",
    opts = {
        highlight = { enable = false },
        
    },
    config = function(_, opts)
        require("mini.trailspace").setup(opts)
        vim.api.nvim_create_autocmd("BufWritePre", {
            callback = function()
                require("mini.trailspace").trim()
            end,
        })
    end,
}
