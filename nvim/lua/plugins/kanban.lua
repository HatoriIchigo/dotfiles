--------------------------------------------------
---
---          かんばん管理
---
--------------------------------------------------
return {
    "arakkkkk/kanban.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim"
    },

    config = function()
        require("kanban").setup({
            markdown = {
                description_folder = "./tasks/",
                list_head = "## ",
            }
        })
    end
}
