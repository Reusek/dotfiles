local utils = require("utils")
local fn = vim.fn

-- Install packer.nvim if it's not installed.
local packer_bootstrap
if not utils.is_plugin_installed("packer.nvim") then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		utils.plugins_path .. "/start/packer.nvim",
	})
vim.cmd([[packadd packer.nvim]])
end

local use = require("packer").use

return require("packer").startup({
	function()
		-- Color scheme.
		use({ "Mofiqul/vscode.nvim" })
		use({ "sainnhe/edge" })
		-- use({
		-- 	"folke/tokyonight.nvim",
		-- 	config = function()
		-- 		require("plugins/tokyonight")
		-- 	end
		-- })

		use 'tanvirtin/monokai.nvim'

		-- TreeSitter.
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			event = { "BufRead", "BufNewFile" },
			cmd = {
				"TSInstall",
				"TSInstallInfo",
				"TSInstallSync",
				"TSUninstall",
				"TSUpdate",
				"TSUpdateSync",
				"TSDisableAll",
				"TSEnableAll",
			},
			config = function()
				require("plugins/treesitter")
			end
		})

		-- Telescope
		use({
			'nvim-telescope/telescope.nvim', tag = '0.1.0',
			requires = { {'nvim-lua/plenary.nvim'} },
		})

		-- NvimTree
		use({
			'kyazdani42/nvim-tree.lua',
			requires = {
				'kyazdani42/nvim-web-devicons', -- optional, for file icons
			},
			tag = 'nightly', -- optional, updated every week. (see issue #1193)
			config = function()
				require("plugins/nvimtree")
			end
		})

		-- EditorConfig
		use({ 'gpanders/editorconfig.nvim' })

		use({
			'nvim-lualine/lualine.nvim',
			requires = { 'kyazdani42/nvim-web-devicons', opt = true },
			config = function()
				require('lualine').setup()
			end
		})

		-- Harpoon
		use({
			'ThePrimeagen/harpoon',
			requires = { 'nvim-lua/plenary.nvim' }
		})

		-- LSP signature
		use({
			"ray-x/lsp_signature.nvim",
			event = "InsertEnter",
			config = function()
				require("lsp_signature").setup()
			end,
		})

		-- LSP
		use({
			"williamboman/nvim-lsp-installer",
			event = { "BufRead", "BufNewFile" },
			cmd = {
				"LspInstall",
				"LspInstallInfo",
				"LspPrintInstalled",
				"LspRestart",
				"LspStart",
				"LspStop",
				"LspUninstall",
				"LspUninstallAll",
			},
		})
		use({
			"jose-elias-alvarez/null-ls.nvim",
			after = "nvim-lsp-installer",
			config = function()
				require("null-ls").setup({
					source = {
					}
				})
			end
		})
		use({ 'neovim/nvim-lspconfig',
			after = {"null-ls.nvim", "lsp_signature.nvim"},
			config = function()
				require("plugins.lsp.lsp")
			end
		})

		-- CMP
		use({
			'hrsh7th/nvim-cmp',
			config = function()
				require("plugins/cmp")
			end
		})
		use({
			'hrsh7th/cmp-nvim-lsp',
			after = "nvim-cmp",
		})
		use({
			'hrsh7th/cmp-nvim-lua',
			after = "nvim-cmp",
		})
		use({
			'hrsh7th/cmp-buffer',
			after = "nvim-cmp",
		})
		use({
			'hrsh7th/cmp-path',
			after = "nvim-cmp",
		})
		use({
			'hrsh7th/cmp-cmdline',
			after = "nvim-cmp",
		})


	end
})
