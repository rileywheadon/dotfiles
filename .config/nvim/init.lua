-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

-- set leader and local leader before installing lazy.nvim
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- install lazy.nvim
require("lazy").setup({

  -- load plugins
  spec = {

    -- gruvbox theme with "dark hard" configuration
    {
      "ellisonleao/gruvbox.nvim",
      priority = 1000,
      config = function()
        vim.o.background = "dark"
        vim.g.gruvbox_contrast_dark = "hard"
        require("gruvbox").setup({
          contrast = "hard",
          italic = {
						strings = false,
            comments = false,
          },
        })
        vim.cmd([[colorscheme gruvbox]])
      end,
    },

    -- telescoping file browser
		{
			'nvim-telescope/telescope.nvim', version = '*',
			dependencies = {
				'nvim-lua/plenary.nvim',
				-- optional but recommended
				{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
			}
		},

		-- oil.nvim for editing files/directories
		{
  		'stevearc/oil.nvim',
			---@module 'oil'
			---@type oil.SetupOpts
			opts = {},
			-- Optional dependencies
			dependencies = { { "nvim-mini/mini.icons", opts = {} } },
			lazy = false,
		},

		-- lualine
		{
			'nvim-lualine/lualine.nvim',
			dependencies = { { "nvim-mini/mini.icons", opts = {} } },
		},

    -- indentation guides
    {
      "lukas-reineke/indent-blankline.nvim",
      main = "ibl",
      ---@module "ibl"
      ---@type ibl.config
      opts = {
        indent = { char = "▏" },
      },
    },
  },

  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "gruvbox" } },

  -- automatically check for plugin updates
  checker = { enabled = true },
})

-- enable line numbers
vim.opt.number = true 
vim.opt.relativenumber = true

-- set default tab size to 4
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4 

-- set tab size to 2 for some file types
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "html", "css", "javascript", "lua", "yaml" },
  callback = function()
  	vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
  end,
})

-- disable spellcheck by default
vim.opt.spell = false
vim.opt.spelllang = 'en_ca'

-- keybinding to open file browser
vim.keymap.set('n', '<leader>e', function()
  require("mini.files").open(vim.api.nvim_buf_get_name(0), false)
end, { desc = "Open mini.files (current file)" })

-- keybindings to save files, close files, and open lazy
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Close file" })
vim.keymap.set("n", "<leader>l", ":Lazy<CR>", { desc = "Open lazy.nvim" })

-- keybindings for telescoping file browser
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

require("oil").setup()
vim.keymap.set('n', '<leader>fo', '<CMD>Oil<Cr>', { desc = 'Edit directory with oil.nvim' })

-- Lualine
vim.o.showtabline = 2
require('lualine').setup({
	icons_enabled = true,
	theme = 'auto',
	sections = {
		lualine_a = {'mode'},
		lualine_b = {'diagnostics'},
		lualine_c = {'filename'},
		lualine_x = {'encoding', 'fileformat', 'filetype'},
		lualine_y = {'progress'},
		lualine_z = {'location'}
	},
	tabline = {
		lualine_a = {'buffers'},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {'tabs'}
	},
})

