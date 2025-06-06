return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettierd,
        -- null_ls.builtins.diagnostics.eslint_d,
        -- null_ls.builtins.code_actions.eslint_d,
        null_ls.builtins.completion.spell,
      },
    })

    vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format()' ]])
    vim.keymap.set("n", "<leader>p", ":Format<cr>")
  end,
}
