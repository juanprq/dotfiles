return {
  "nvim-tree/nvim-tree.lua",
  config = function()
    local nvimTree = require("nvim-tree")
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    vim.keymap.set("", "<leader>tt", ":NvimTreeToggle<cr>")
    vim.keymap.set("", "<leader>tf", ":NvimTreeFindFile<cr>")

    nvimTree.setup({
      open_on_tab = false,
      git = { ignore = false },
      sync_root_with_cwd = true,
      view = {
        adaptive_size = true,
      },
      update_focused_file = {
        enable = true,
        update_cwd = true,
      },
    })

    local function open_nvim_tree(data)
      -- buffer is a directory
      local directory = vim.fn.isdirectory(data.file) == 1

      if not directory then
        return
      end

      -- change to the directory
      vim.cmd.cd(data.file)

      -- open the tree
      require("nvim-tree.api").tree.open()
    end

    local function refresh_nvim_tree()
      require("nvim-tree.api").tree.reload()
    end

    vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
    vim.api.nvim_create_autocmd({ "TabEnter" }, { callback = refresh_nvim_tree })
  end,
}
