----------------------------------------------------------
---
---           プロジェクト管理プラグイン
---
----------------------------------------------------------
return {
    'DrKJeff16/project.nvim',
    dependencies = { -- OPTIONAL
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope.nvim',
        'ibhagwan/fzf-lua',
    },
    configure = function()
        require('project_nvim').setup({
            detection_methods = { "pattern", "lsp" },
            patterns = { ".git", "Makefile", "package.json" },
            show_hidden = true,
            silent_chdir = false,

            require("telescope").load_extension("projects")
        })
    end,
    opts = {},
}
