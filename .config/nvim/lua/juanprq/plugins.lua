local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local lazy = require('lazy');
lazy.setup({
  'wakatime/vim-wakatime',
  'ThePrimeagen/vim-be-good',
  'karb94/neoscroll.nvim',
  'nvim-lua/plenary.nvim',
  'kyazdani42/nvim-web-devicons',
  'windwp/nvim-autopairs',
  'windwp/nvim-ts-autotag',
  'ellisonleao/gruvbox.nvim',
  'savq/melange',
  'neovim/nvim-lspconfig',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'onsails/lspkind-nvim',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'glepnir/lspsaga.nvim',
  'L3MON4D3/LuaSnip',
  'jose-elias-alvarez/null-ls.nvim',
  'MunifTanjim/prettier.nvim',
  'nvim-telescope/telescope.nvim',
  'nvim-telescope/telescope-file-browser.nvim',
  'akinsho/nvim-bufferline.lua',
  'christoomey/vim-tmux-navigator',
  'lewis6991/gitsigns.nvim',
  'numToStr/Comment.nvim',
  'folke/which-key.nvim',
  'nvim-treesitter/nvim-treesitter-textobjects',
  'kylechui/nvim-surround',
  'folke/trouble.nvim',
  {
    'kyazdani42/nvim-tree.lua',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    tag = 'nightly',
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons', lazy = true }
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate'
  },
})
