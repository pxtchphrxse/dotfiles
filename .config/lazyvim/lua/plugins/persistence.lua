return {
  "folke/persistence.nvim",
  event = "BufReadPre", -- this will only start session saving when an actual file was opened
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
