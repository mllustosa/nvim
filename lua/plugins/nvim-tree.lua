return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- Disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- Set termguicolors to enable highlight groups
    vim.opt.termguicolors = true

    local function on_attach(bufnr)
      local api = require "nvim-tree.api"

      -- Default mappings
      api.config.mappings.default_on_attach(bufnr)
      vim.keymap.set("n", "<leader>e", api.tree.toggle)
    end

    -- Setup with some options
    require("nvim-tree").setup({
      sync_root_with_cwd = true,
      sort = {
        sorter = "case_sensitive",
      },
      update_focused_file = {
        enable = true,
        update_root = true,
        ignore_list = { "help" },
      },
      diagnostics = {
        enable = true,
        show_on_dirs = true,
      },
      view = {
        width = 30,
        relativenumber = true,
      },
      on_attach = on_attach,
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = true,
      },
    })
  end
}
