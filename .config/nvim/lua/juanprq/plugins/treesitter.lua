return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function ()
    local treesitter = require('nvim-treesitter.configs')
    treesitter.setup({
      ensure_installed = { 'c', 'lua', 'rust', 'typescript', 'javascript', 'vimdoc' },
      sync_install = false,
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
