-- automatically trim whitespace
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    local view = vim.fn.winsaveview()

    -- remove trailing whitespace
    vim.cmd([[%s/\s\+$//e]])

    -- remove blank lines at end of file
    vim.cmd([[%s/\($\n\s*\)\+\%$//e]])

    vim.fn.winrestview(view)
  end,
})

-- automatic formatting for Golang files
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    vim.lsp.buf.format({async = false})
  end
})

