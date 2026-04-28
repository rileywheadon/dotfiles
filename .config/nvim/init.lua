-- bootstrap lazy.nvim and install plugins
require("config.lazy")

-- core configuration (calls to vim.opt)
require("core.opts")

-- keymaps for plugins/LSP
require("core.keymaps")

-- enable LSPs (configured in the lsps/ directory)
vim.lsp.enable({
	"gopls",
	"marksman"
})

-- load snippets
if not vim.g.vscode then
	for _, path in ipairs(vim.api.nvim_get_runtime_file("lua/snippets/*.lua", true)) do
		loadfile(path)()
	end
end

-- filetype mappings
vim.filetype.add({
  extension = {
		tpl = 'yaml',
    mdx = 'markdown',
  },
})
