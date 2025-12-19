--
-- ddu.lua
-- ddu関連の設定を記述
--

-- ファイルリスト取得

-- テスト用

vim.fn["ddu#custom#patch_local"]("file_recursive", {
    ui = "ff",
    sources = {
        {
            name = { "file_rec" },
            options = {
                matchers = {
                    "matcher_substring",
                },
            },
        },
    },
    kindOptions = {
        file = {
            defaultAction = "open",
        }
    }
})

vim.api.nvim_create_autocmd("FileType",{
    pattern = "ddu-ff",
    callback = function()
        local opts = { noremap = true, silent = true, buffer = true }
        vim.keymap.set({ "n" }, "q", [[<Cmd>call ddu#ui#do_action("quit")<CR>]], opts)
        vim.keymap.set({ "n" }, "<Cr>", [[<Cmd>call ddu#ui#do_action("itemAction")<CR>]], opts)
        vim.keymap.set({ "n" }, "i", [[<Cmd>call ddu#ui#do_action("openFilterWindow")<CR>]], opts)
    end,
})


