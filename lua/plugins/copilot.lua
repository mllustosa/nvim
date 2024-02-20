return {
  "github/copilot.vim",
  config = function()
    -- Disable by default
    -- vim.g.copilot_filetypes = {["*"] = false}

    -- Tab already used in cmp setup above
    vim.g.copilot_no_tab_map = true

    -- Request suggestions manually
    -- vim.keymap.set('i', '<C-Space>', 'copilot#Suggest()', {
    --   expr = true,
    --   replace_keycodes = false,
    -- })

    -- Accept current suggestion
    -- vim.keymap.set('i', '<C-Enter>', 'copilot#Accept("")', {
    --   expr = true,
    --   replace_keycodes = false
    -- })
  end
}
