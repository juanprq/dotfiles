local keymap = vim.keymap

-- Set the leader key
vim.g.mapleader = ' '

keymap.set('n', 'x', '"_x')
keymap.set('n', '<esc>', '<cmd> noh <CR>')
keymap.set('n', 'tt', ':tabnew <CR>')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- New tab
keymap.set('n', 'te', ':tabedit')

-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')

-- Resize window
keymap.set('n', '<leader><left>', '<C-w><')
keymap.set('n', '<leader><right>', '<C-w>>')
keymap.set('n', '<leader><up>', '<C-w>+')
keymap.set('n', '<leader><down>', '<C-w>-')

-- Mine
keymap.set('n', '<leader>o', 'o<Esc>')
keymap.set('n', '<leader>O', 'O<Esc>')

keymap.set('', '<C-j>', '<C-w>j')
keymap.set('', '<C-k>', '<C-w>k')
keymap.set('', '<C-h>', '<C-w>h')
keymap.set('', '<C-l>', '<C-w>l')

-- Scroll without moving the cursor from the middle
keymap.set('n', '<C-d>', '<C-d>zz')
keymap.set('n', '<C-u>', '<C-u>zz')
