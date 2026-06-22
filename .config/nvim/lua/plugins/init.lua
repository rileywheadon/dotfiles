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
				ensure_installed = {
					"go",
					"groovy",
					"lua",
					"python",
					"nix",
					"yaml",
					"helm",
					"markdown",
					"latex"
				}
			})
		end
	},

	-- LuaSnip for snippets
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*", 
		config = function()
			require("luasnip").config.set_config({
				enable_autosnippets = true,
			})
		end
	},

	-- blink.cmp for completions
	{
		'saghen/blink.cmp',
		dependencies = { 
			'L3MON4D3/LuaSnip', version = 'v2.*' 
		},

		-- use stable 1.* version
		version = '1.*',

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {

			-- uses <C-y> to accept, <C-p>, <C-n> to switch
			keymap = { preset = 'default' },

			-- use monospace version of nerd font instead of regular
			appearance = { nerd_font_variant = 'mono' },

			-- use LuaSnip for snippets
			snippets = { preset = 'luasnip' },

			-- set list of enabled providers
			sources = { default = { 'lsp', 'snippets' } },

			-- use lua fuzzy finder as the rust one is not installed
			fuzzy = { implementation = "lua" }
		},
	},

	-- markdown previewer
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
			vim.g.mkdp_theme = "dark"
			vim.g.mkdp_auto_close = 0
			vim.g.mkdp_combine_preview = 1
		end,
		ft = { "markdown" },
	}
}
