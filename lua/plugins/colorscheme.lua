return {
  { "morhetz/gruvbox" },
  { "folke/tokyonight.nvim" },
  { "Mofiqul/vscode.nvim" },
  { "Rigellute/shades-of-purple.vim" },
  {
    "rebelot/kanagawa.nvim",
    config = function()
      vim.cmd.colorscheme("kanagawa");
    end
  }
}
