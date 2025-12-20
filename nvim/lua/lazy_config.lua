--- Bootstrap lazy.nvim
local lazypath = os.getenv("HOME") .. "/.config/nvim/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({"git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath})
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            {"Failed to clone lazy.nvim:\n", "ErrorMsg"},
            {out, "WarningMsg"},
            {"\nPress any key to exit..."},
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy").setup({
    spec = {
        ---------------------------------------------------------
        ---                  ビジュアル                      ---
        ---------------------------------------------------------
        -- カラースキーマ
        {"tomasr/molokai"},
        -- ステータスバー＆タブバー
        {"nvim-lualine/lualine.nvim"},
        -- アイコン系
        {"nvim-tree/nvim-web-devicons"},
        {"ryanoasis/vim-devicons"},
        -- gitとの差分の行を色で表示する
        {"lewis6991/gitsigns.nvim"},
        -- ポップアップで表示する系
        {"akinsho/toggleterm.nvim"},
        -- 同じ単語をハイライト
        {"RRethy/vim-illuminate"},
        -- cssで色番号を実際の色で表示する
        {"norcalli/nvim-colorizer.lua"},
        -- スクロールバー
        {"petertriho/nvim-scrollbar"},
        -- ウィンドウ関連操作のプラグイン
        {"tkmpypy/chowcho.nvim"},
        -- 行末の空白スペースを表示
        {"ntpeters/vim-better-whitespace"},
        -- 検索ハイライトプラグイン
        {"kevinhwang91/nvim-hlslens"},
        -- 集中モード
        { import = "plugins.zenmode" },

        ---------------------------------------------------------
        ---                   Git操作                         ---
        ---------------------------------------------------------
        { import = "plugins.diffview" },

        ---------------------------------------------------------
        ---                  ファイラー                       ---
        ---------------------------------------------------------
        -- {"lambdalisue/fern.vim"},
        -- {"lambdalisue/fern-renderer-devicons.vim"},
        -- {"lambdalisue/glyph-palette.vim"},
        { import = "plugins.neo-tree" },

        ---------------------------------------------------------
        ---                     LSP                           ---
        ---------------------------------------------------------
        -- ビジュアル
        {"nvimdev/lspsaga.nvim"},
        -- 自動補完プラグイン
        {"hrsh7th/nvim-cmp"},
        {"neovim/nvim-lspconfig"},
        {"hrsh7th/cmp-nvim-lsp"},
        {"hrsh7th/cmp-buffer"},
        {"hrsh7th/cmp-path"},
        {"hrsh7th/vim-vsnip"},
        {
            "zbirenbaum/copilot-cmp",
            config = function()
                require("copilot_cmp").setup()
            end
        },
        {
            "zbirenbaum/copilot.lua",
            cmd = "Copilot",
            event = "InsertEnter",
            config = function()
                require("copilot").setup({
                    suggestion = { enabled = false, auto_trigger = false, keymap = { accept = false } },
                    panel = { enabled = true },
                    filetypes = { markdown = true, ["."] = false }
                })
            end
        },
        -- cmp補完でアイコンを出す
        {"onsails/lspkind.nvim"},
        -- luaSnip補完
        {"L3MON4D3/LuaSnip"},
        -- lint
        {"jose-elias-alvarez/null-ls.nvim"},

        -- Java用LS
        {"mfussenegger/nvim-jdtls"},


        -- 非同期処理用？
        {"nvim-lua/plenary.nvim"},

        -- error/warnなどを表示
        { import = "plugins.trouble" },

        ---------------------------------------------------------
        ---                     AI関連                        ---
        ---------------------------------------------------------
        { import = "plugins.claude" },

        ---------------------------------------------------------
        ---                  ファインダー                     ---
        ---------------------------------------------------------
        {"nvim-telescope/telescope.nvim"},
        {"nvim-telescope/telescope-project.nvim"},

        ---------------------------------------------------------
        ---                    その他                         ---
        ---------------------------------------------------------
        {"lambdalisue/vim-readablefold"},
        {"mattn/vim-sonictemplate"},
        {"stevearc/aerial.nvim"},
        -- キー操作のヒントを表示
        {"folke/which-key.nvim"},
        {"folke/noice.nvim"},
        {"MunifTanjim/nui.nvim"},
        {"rcarriga/nvim-notify"},
        {"numToStr/Comment.nvim"},
        {"Wansmer/treesj"},
        {"monaqa/dial.nvim"},
        {"cohama/lexima.vim"},
        {"lukas-reineke/indent-blankline.nvim"},
        {"HiPhish/rainbow-delimiters.nvim"},
        {"nvim-treesitter/nvim-treesitter"},

    }
})
