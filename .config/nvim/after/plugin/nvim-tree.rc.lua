local status, nvimTree = pcall(require, 'nvim-tree');

if (not status) then
  return
end

nvimTree.setup({
  open_on_tab = true,
  git = { ignore = false },
})

vim.keymap.set('', '<leader>tt', ':NvimTreeToggle<cr>')
vim.keymap.set('', '<leader>tf', ':NvimTreeFindFile<cr>')

local function open_nvim_tree(data)
  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if not directory then
    return
  end

  -- change to the directory
  vim.cmd.cd(data.file)

  -- open the tree
  require('nvim-tree.api').tree.open()
end

vim.api.nvim_create_autocmd({ 'VimEnter' }, { callback = open_nvim_tree })
