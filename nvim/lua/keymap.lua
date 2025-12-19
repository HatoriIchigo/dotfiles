--------------------------------------------------
---  keymap.lua
---  基本的なキーバインディングはこのファイルに記載
--------------------------------------------------

-- leader keyの設定
vim.g.mapleader = " "

-- normalモード時の設定
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true })
vim.api.nvim_set_keymap('n', '<up>', 'gk', { noremap = true })
vim.api.nvim_set_keymap('n', '<down>', 'gj', { noremap = true })
vim.api.nvim_set_keymap('n', '<Esc><Esc>', ':nohlsearch<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-j>', ':bprev<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', ':bnext<CR>', { noremap = true })
-- 通常のvimの拡張
vim.api.nvim_set_keymap('n', '<leader>bc', '<cmd>BufferClose<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ko', 'o<Esc>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>kp', 'yyp', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>k=', [[:let l:line = line('.')<CR>gg=G<CR>call cursor(l:line,0)<CR>]], { noremap = true })

-- insertモード時の設定
vim.api.nvim_set_keymap('i', 'fj', '<Esc><Esc>', { silent = true })
vim.api.nvim_set_keymap("i", "<C-h>", "<Left>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-j>", "<Down>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-k>", "<Up>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-l>", "<Right>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-o>", "<Esc>o", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-n>", "<BS>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-u>", "<Del>", { noremap = true, silent = true })

-- fern
vim.api.nvim_set_keymap('n', '<leader>n', ':Fern . -reveal=%<CR>', { noremap = true })

-- telescope
local telescope = require("telescope.builtin")
vim.keymap.set('n', '<leader>tt', telescope.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>tf', telescope.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>tb', telescope.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>th', telescope.help_tags, { desc = 'Telescope help tags' })

-- lsp
vim.api.nvim_set_keymap('n', '<leader>lf', '<cmd>Lspsaga finder<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>lh', '<cmd>Lspsaga hover_doc<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>lc', '<cmd>Lspsaga code_action<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ls', '<cmd>Lspsaga show_line_diagnostics<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ln', '<cmd>Lspsaga diagnostic_jump_next<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>lp', '<cmd>Lspsaga diagnostic_jump_prev<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>lg', '<cmd>Lspsaga goto_definition<CR>', { noremap = true })

-- aerial
vim.api.nvim_set_keymap('n', '<leader>aa', '<cmd>AerialToggle<CR>', { noremap = true })

-- treesj
vim.api.nvim_set_keymap('n', '<leader>jj', '<cmd>lua require("treesj").toggle()<CR>', { noremap = true })

-- lazygit
local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", direction = "float", hidden = true })

function _lazygit_toggle()
	lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })

