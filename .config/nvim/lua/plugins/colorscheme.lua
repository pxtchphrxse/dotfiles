return {
  "navarasu/onedark.nvim",
  {
    "olimorris/onedarkpro.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme onedark_dark]])
      vim.cmd([[hi CursorLine guibg=#16181d]])
    end,
  },
  "lunarvim/colorschemes",
  "folke/tokyonight.nvim",
  "artanikin/vim-synthwave84",
  "bluz71/vim-nightfly-guicolors",
}
