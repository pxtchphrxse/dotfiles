return {
  {
    "folke/todo-comments.nvim",
    keys = function()
      return {
        {
          "<leader>st",
          "<cmd>lua require('fzf-lua').grep({search='TODO|HACK|PERF|NOTE|FIX', no_esc=true})<cr>",
          desc = "Todo",
        },
      }
    end,
  },
}
