--
-- lualine.lua
-- ステータスバーの設定
--

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'powerline',
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        },
        sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'branch', 'diff', 'diagnostics' },
            lualine_c = { 'filename' },
            lualine_x = { 'encoding', 'fileformat', 'filetype' },
            lualine_y = {''},
            lualine_z = {'location'},
        },
    }
}
