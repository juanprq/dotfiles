local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  -- Themes
  'ellisonleao/gruvbox.nvim',
  'rebelot/kanagawa.nvim',

  -- UI
  'nvim-tree/nvim-tree.lua',
  'nvim-tree/nvim-web-devicons',
  'nvim-lualine/lualine.nvim',

  -- Utilities
  'windwp/nvim-autopairs',
  'lewis6991/gitsigns.nvim',
  'preservim/vimux',
  'christoomey/vim-tmux-navigator',
  'tpope/vim-commentary',
  'kylechui/nvim-surround',
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },

  -- Sintax Highlight
  'nvim-treesitter/nvim-treesitter',

  -- Completion with LSP
  {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  dependencies = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},

      -- Formatting
      {'jose-elias-alvarez/null-ls.nvim'},
	  }
  },

  -- Other nice plugins (not 100% required)
  'wakatime/vim-wakatime',
  'ThePrimeagen/vim-be-good',
  'karb94/neoscroll.nvim',
  'windwp/nvim-ts-autotag',
  'folke/which-key.nvim',
  'akinsho/nvim-bufferline.lua',
}

local opts = {}

require('lazy').setup(plugins, opts)
