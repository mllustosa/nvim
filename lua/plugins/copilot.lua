return {
  "github/copilot.vim",
  config = function()
    -- Dismiss Copilot suggestions with <C-c>
    -- By default the suggestions are dismissed with <Esc>
    vim.keymap.set("i", "<C-c>", "<Plug>(copilot-dismiss)<C-c>", { noremap = true })
  end
}
