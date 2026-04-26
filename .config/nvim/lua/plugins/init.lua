return {

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
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		}
	},

	-- oil.nvim for editing files/directories
	{
		'stevearc/oil.nvim',
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {},
		dependencies = { { "nvim-mini/mini.icons", opts = {} } },
		lazy = false,
	},

	-- lualine
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { { "nvim-mini/mini.icons", opts = {} } },
		config = function()
			vim.o.showtabline = 2 -- always show tabline
			require('lualine').setup({
				icons_enabled = true,
				theme = 'auto',
				sections = {
					lualine_a = {'mode'},        -- e.g. normal, insert
					lualine_b = {'diagnostics'}, -- diagnostics from LSP
					lualine_c = {'filename'},
					lualine_x = {},
					lualine_y = {'filetype'},    -- e.g. lua, go
					lualine_z = {'location'}     -- ROW:COLUMN of cursor
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
		end
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

	-- manager for tree-sitter grammars
	{
		"romus204/tree-sitter-manager.nvim",
		dependencies = {},
		config = function()
			require("tree-sitter-manager").setup({
				ensure_installed = { "go", "groovy", "lua", "markdown", "python" }
			})
		end
	}
}
