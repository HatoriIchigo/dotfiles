--
-- lspconfig.lua
-- LS(サーバ)周りのプラグインの設定
--

local neovim_settings_root_dir = os.getenv('HOME') .. '/.config/nvim/'
vim.lsp.set_log_level('warn')

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

local java_lsp_folder = neovim_settings_root_dir .. 'lsp/java/'
local jdtls_laucher = vim.fn.glob(java_lsp_folder .. 'plugins/org.eclipse.equinox.launcher_*.jar')
local lombok = java_lsp_folder .. 'lombok.jar'
require('lspconfig').jdtls.setup {
    cmd = {
        'java',
        '-jar', '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-javaagent:' .. lombok,
        '-Xbootclasspath/a:' .. lombok,
        '-jar', jdtls_laucher,
        '-configuration', java_lsp_folder .. 'config_linux',
        '-data', os.getenv('HOME') .. '/eclipse-workspace'
    },
    root_dir = vim.fs.dirname(vim.fs.find({'.git', 'pom.xml'}, { upward = true })[1]),
    settings = {
        java = {
            trace = { server = "off" },
            configuration = {
                updateBuildConfiguration = "interactive"
            }
        }
    }
}

