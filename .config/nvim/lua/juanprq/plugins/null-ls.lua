return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.code_actions.gitsigns,
        null_ls.builtins.code_actions.refactoring,

        require("none-ls.formatting.eslint_d"),
        require("none-ls.code_actions.eslint_d"),
        require("none-ls.diagnostics.eslint_d"),
      },
    })

    vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format()' ]])
    vim.keymap.set("n", "<leader>p", ":Format<cr>")
  end,
}
