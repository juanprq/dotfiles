return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function ()
      local builtin = require('telescope.builtin')

      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {})
      vim.keymap.set('n', '<leader>fw', builtin.live_grep, {})
      vim.keymap.set('n', '<Space>fh', builtin.help_tags, {}) -- nvim help documentation
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>fr', builtin.resume, {}) -- open the last telescope that was opened
      vim.keymap.set('n', '<leader>fd', builtin.diagnostics, {})
      vim.keymap.set('n', '<leader>fc', builtin.commands, {})
      vim.keymap.set('n', '<leader>cc', builtin.colorscheme, {})
      vim.keymap.set('n', '<leader>qf', builtin.quickfix, {})
      vim.keymap.set('n', '<leader>ft', builtin.treesitter, {})
      vim.keymap.set('n', '<leader>fk', builtin.keymaps, {})
    end
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function ()
      require('telescope').setup({
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown({})
          },
        },
      })
      require('telescope').load_extension('ui-select')
    end
  }
}
