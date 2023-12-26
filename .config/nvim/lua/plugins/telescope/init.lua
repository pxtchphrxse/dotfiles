return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "kdheepak/lazygit.nvim", "ahmedkhalf/project.nvim" },
    config = function()
      require("plugins.telescope.telescope-setup")
    end,
  },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("plugins.telescope.project-setup")
    end,
  },
}
