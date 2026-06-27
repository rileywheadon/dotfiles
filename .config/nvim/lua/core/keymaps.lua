-- keymaps for saving/closing files
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Close file" })

-- keymaps for lazy.nvim
vim.keymap.set("n", "<leader>l", ":Lazy<CR>", { desc = "Open lazy.nvim" })

-- keymaps for telescoping file browser
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Telescope find diagnostics" })

-- keymaps for oil.nvim
vim.keymap.set("n", "<leader>fo", "<CMD>Oil<Cr>", { desc = "Edit directory with oil.nvim" })

-- keymaps for LSP integration
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local opts = { buffer = args.buf }

	-- default:   ("n", "gx"): opens documentation for package
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

  end,
})

-- keymap to open treesitter manager
vim.keymap.set("n", "<leader>tm", ":TSManager<CR>", { desc = "Open tree-sitter manager" })

-- keymap to open and close markdown preview
vim.keymap.set("n", "<leader>mp", ":MarkdownPreview<CR>", { desc = "Open markdown preview" })
vim.keymap.set("n", "<leader>mc", ":MarkdownPreviewStop<CR>", { desc = "Close markdown preview" })
vim.keymap.set("n", "<leader>mr", ":MarkdownPreviewRefresh<CR>", { desc = "Refresh markdown preview" })
