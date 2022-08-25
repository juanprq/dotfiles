local status, nvimTree = pcall(require, 'nvim-tree');
if (not status) then
  return
end

nvimTree.setup({
  open_on_tab = true,
  open_on_setup = true,
  open_on_setup_file = true,
  git = { ignore = false },
})

vim.keymap.set('', '<leader>tt', ':NvimTreeToggle<cr>')
vim.keymap.set('', '<leader>tf', ':NvimTreeFindFileToggle<cr>')
