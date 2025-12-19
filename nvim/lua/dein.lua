local dein_dir = vim.env.HOME .. '/.config/nvim/dein.vim'

if not string.match(vim.o.runtimepath, '/dein.vim') then
    vim.o.runtimepath = dein_dir .. ',' .. vim.o.runtimepath
end

if vim.call('dein#load_state', dein_dir) == 1 then
    vim.call('dein#begin', dein_dir)

    ---------------------------------------------------------
    ---                  ビジュアル                      ---
    ---------------------------------------------------------
    -- カラースキーマ
    vim.call('dein#add', 'tomasr/molokai')
    -- ステータスバー＆タブバー
    vim.call('dein#add', 'nvim-lualine/lualine.nvim')
    vim.call('dein#add', 'romgrk/barbar.nvim')
    -- アイコン系
    vim.call('dein#add', 'nvim-tree/nvim-web-devicons')
    vim.call('dein#add', 'ryanoasis/vim-devicons')
    -- gitとの差分の行を色で表示する
    vim.call('dein#add', 'lewis6991/gitsigns.nvim')
    -- ポップアップで表示する系
    vim.call('dein#add', 'akinsho/toggleterm.nvim')
    -- 同じ単語をハイライト
    vim.call('dein#add', 'RRethy/vim-illuminate')
    -- cssで色番号を実際の色で表示する
    vim.call('dein#add', 'norcalli/nvim-colorizer.lua')
    -- スクロールバー
    vim.call('dein#add', 'petertriho/nvim-scrollbar')
    -- ウィンドウ関連操作のプラグイン
    vim.call('dein#add', 'tkmpypy/chowcho.nvim')
    -- 行末の空白スペースを表示
    vim.call('dein#add', 'ntpeters/vim-better-whitespace')
    -- 検索ハイライトプラグイン
    vim.call('dein#add', 'kevinhwang91/nvim-hlslens')

    ---------------------------------------------------------
    ---                  ファイラー                       ---
    ---------------------------------------------------------
    vim.call('dein#add', 'lambdalisue/fern.vim')
    vim.call('dein#add', 'lambdalisue/fern-renderer-devicons.vim')
    vim.call('dein#add', 'lambdalisue/glyph-palette.vim')

    ---------------------------------------------------------
    ---                     LSP                           ---
    ---------------------------------------------------------
    -- ビジュアル
    vim.call('dein#add', 'nvimdev/lspsaga.nvim')
    -- 自動補完プラグイン
    vim.call('dein#add', 'hrsh7th/nvim-cmp')
    vim.call('dein#add', 'neovim/nvim-lspconfig')
    -- lsp補完
    vim.call('dein#add', 'hrsh7th/cmp-nvim-lsp')
    -- バッファ補完
    vim.call('dein#add', 'hrsh7th/cmp-buffer')
    -- パス補完
    vim.call('dein#add', 'hrsh7th/cmp-path')
    -- cmp補完でアイコンを出す
    vim.call('dein#add', 'onsails/lspkind.nvim')
    -- luaSnip補完
    vim.call('dein#add', 'L3MON4D3/LuaSnip')
    -- 自動補完管理プラグイン
    vim.call('dein#add', 'williamboman/mason.nvim')
    vim.call('dein#add', 'williamboman/mason-lspconfig.nvim')
    -- lint
    vim.call('dein#add', 'jose-elias-alvarez/null-ls.nvim')

    -- Java用LS
    vim.call('dein#add', 'mfussenegger/nvim-jdtls')


    -- 非同期処理用？
    vim.call('dein#add', 'nvim-lua/plenary.nvim')

    ---------------------------------------------------------
    ---                  ファインダー                     ---
    ---------------------------------------------------------
    vim.call('dein#add', 'nvim-telescope/telescope.nvim')
    vim.call('dein#add', 'nvim-telescope/telescope-project.nvim')

    ---------------------------------------------------------
    ---                    その他                         ---
    ---------------------------------------------------------
    vim.call('dein#add', 'lambdalisue/vim-readablefold')
    vim.call('dein#add', 'mattn/vim-sonictemplate')
    vim.call('dein#add', 'stevearc/aerial.nvim')
    -- キー操作のヒントを表示
    vim.call('dein#add', 'folke/which-key.nvim')
    vim.call('dein#add', 'folke/noice.nvim')
    vim.call('dein#add', "MunifTanjim/nui.nvim")
    vim.call('dein#add', "rcarriga/nvim-notify")
    vim.call('dein#add', 'numToStr/Comment.nvim')
    vim.call('dein#add', 'Wansmer/treesj')
    vim.call('dein#add', 'monaqa/dial.nvim')
    vim.call('dein#add', 'cohama/lexima.vim')
    vim.call('dein#add', 'lukas-reineke/indent-blankline.nvim')
    vim.call('dein#add', 'HiPhish/rainbow-delimiters.nvim')
    vim.call('dein#add', 'nvim-treesitter/nvim-treesitter')

    vim.call('dein#end')
    vim.call('dein#save_state')
end
