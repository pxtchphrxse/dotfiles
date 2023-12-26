return {
  "tpope/vim-fugitive",
  "kdheepak/lazygit.nvim",
  {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    config = require("plugins.git-integration.gitsigns-config"),
  },
}
