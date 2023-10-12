local status, theme = pcall(require, 'kanagawa')
if (not status) then return end

vim.opt.termguicolors = true
vim.cmd('colorscheme kanagawa-dragon')
