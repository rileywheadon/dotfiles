-- enable line numbers
vim.opt.number = true 
vim.opt.relativenumber = true

-- disable spellcheck by default
vim.opt.spell = false
vim.opt.spelllang = 'en_ca'

-- set default tab size to 4
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4 

-- make LSP diagnostics look more pleasant
vim.diagnostic.config({

  -- disable signs in the left gutter
  signs = false,

  -- enable virtual text at the end of the line
  virtual_text = true,

  -- underline the actual error in the code
  underline = true,

})

-- treat tpl files like yaml
vim.filetype.add({
  extension = {
    tpl = 'yaml',
  },
})
