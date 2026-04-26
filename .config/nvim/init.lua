-- bootstrap lazy.nvim and install plugins
require("config.lazy")

-- core configuration (calls to vim.opt)
require("core.opts")

-- keymaps for plugins/LSP
require("core.keymaps")

-- enable LSPs (configured in the lsps/ directory)
vim.lsp.enable({
	"gopls"
})


