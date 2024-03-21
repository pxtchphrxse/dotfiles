return {
  "folke/persistence.nvim",
  keys = function()
    return {
      {
        "<leader>R",
        function()
          require("persistence").load()
        end,
        desc = "Restore Session",
      },
    }
  end,
}
