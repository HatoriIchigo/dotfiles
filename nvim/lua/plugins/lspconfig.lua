--
-- lspconfig.lua
-- LS(サーバ)周りのプラグインの設定
--

local neovim_settings_root_dir = os.getenv('HOME') .. '/.config/nvim/'
-- vim.lsp.set_log_level('debug')

require('lspconfig').pyright.setup {
}

require('lspconfig').bashls.setup {
}

require('lspconfig').html.setup {
}

require('lspconfig').cssls.setup {
}

require('lspconfig').jsonls.setup {
}

require('lspconfig').gopls.setup {
}

print(neovim_settings_root_dir)
require('lspconfig').jdtls.setup {
  cmd = {
    'java',
    '-jar', '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-jar', neovim_settings_root_dir .. 'lsp/java/plugins/org.eclipse.equinox.launcher_1.6.900.v20240613-2009.jar',
    '-configuration', neovim_settings_root_dir .. 'lsp/java/config_linux',
    '-data', os.getenv('HOME') .. '/eclipse-workspace'
  },
  root_dir = vim.fs.dirname(vim.fs.find({'.git', 'pom.xml'}, { upward = true })[1])
}

