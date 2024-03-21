return {
  "lewis6991/gitsigns.nvim",
  keys = {
    {
      "<leader>gk",
      function()
        require("gitsigns").prev_hunk()
      end,
      desc = "Previous Hunk",
    },
    {
      "<leader>gj",
      function()
        require("gitsigns").next_hunk()
      end,
      desc = "Next Hunk",
    },
  },
}
