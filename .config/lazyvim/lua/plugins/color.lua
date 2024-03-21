return {
  {
    "olimorris/onedarkpro.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme onedark_dark]])
      -- vim.cmd([[hi CursorLine guibg=#16181d]])
    end,
  },
}
