return {
  { "morhetz/gruvbox" },
  { "folke/tokyonight.nvim" },
  {
    "rebelot/kanagawa.nvim",
    config = function()
      vim.cmd.colorscheme("kanagawa");
    end
  }
}
