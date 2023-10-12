local status, null_ls = pcall(require, 'null-ls')
if (not status) then return end

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.eslint,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.completion.spell,
    },
})

vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format()' ]])
vim.keymap.set('n', '<leader>p', ':Format<cr>')
