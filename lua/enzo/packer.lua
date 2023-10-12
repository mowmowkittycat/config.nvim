

vim.cmd [[packadd packer.nvim]]

local packer = require('packer')



packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})


return packer.startup(function() 
    use "nvim-lua/plenary.nvim"
	use 'wbthomason/packer.nvim'
	use 'catppuccin/nvim'
	use 'lambdalisue/suda.vim'
	use 'nvim-treesitter/nvim-treesitter'
	use 'kyazdani42/nvim-web-devicons'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'saadparwaiz1/cmp_luasnip'
	use 'L3MON4D3/LuaSnip'
	use 'rafamadriz/friendly-snippets'
    use {
    "lopi-py/luau-lsp.nvim",
    requires = { "nvim-lua/plenary.nvim" }
  }
    use {'nvim-orgmode/orgmode', config = function()
      require('orgmode').setup{}
    end}
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"
    use "neovim/nvim-lspconfig" -- enable LSP
    use "williamboman/mason.nvim" -- simple to use language server installer
    use "williamboman/mason-lspconfig.nvim" -- simple to use language server installer
    use 'jose-elias-alvarez/null-ls.nvim' -- LSP diagnostics and code actions
    use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}
	use {
	  'nvim-tree/nvim-tree.lua',
	  requires = {
	    'nvim-tree/nvim-web-devicons', -- optional, for file icons
	  },
	  tag = 'nightly' -- optional, updated every week. (see issue #1193)
	}
	use {
	  'nvim-lualine/lualine.nvim',
	  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
    use "akinsho/toggleterm.nvim"
    use 'dhruvasagar/vim-table-mode'
end)
