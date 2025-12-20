----------------------------------------------------------
---
--- Plugin: claude.nvim
---
----------------------------------------------------------
return {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    opts = {
        terminal_cmd = "/usr/bin/claude",
    }
}
