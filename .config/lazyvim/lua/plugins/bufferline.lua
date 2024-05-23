return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = {
      { "tiagovla/scope.nvim", opts = {} }, -- show only buffers opened in tab
      { "nvim-tree/nvim-web-devicons" },
    },
    keys = function()
      return {
        { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous Buffer" },
        { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
        { "<leader>bh", "<cmd>BufferLineCloseLeft<cr>", "Close all to the left" },
        { "<leader>bl", "<cmd>BufferLineCloseRight<cr>", "Close all to the right" },
        { "<leader>bj", "<cmd>BufferLinePick<cr>", desc = "Jump" },
        { "<leader>be", "<cmd>BufferLinePickClose<cr>", desc = "Pick Close" },
        { "<leader>bp", "<cmd>BufferLineMovePrev<cr>", desc = "Move Left" },
        { "<leader>bn", "<cmd>BufferLineMoveNext<cr>", desc = "Move Right" },
        { "<leader>bm", "<cmd>MaximizerToggle<cr>", desc = "Maximize Window" },
        { "<leader>bt", "<cmd>tabe<cr>", desc = "New Tab" },
        { "<leader>bx", "<cmd>tabc<cr>", desc = "Close Tab" },
        { "<tab>", "<cmd>tabnext<cr>", desc = "Next Tab" },
        { "<S-tab>", "<cmd>tabprev<cr>", desc = "Previous Tab" },
        {
          "<leader>x",
          LazyVim.ui.bufremove,
          "Close Buffer",
        },
      }
    end,
    opts = function(_, opts)
      opts.options.always_show_bufferline = true
      opts.highlights = {
        buffer_selected = {
          italic = false,
          fg = "#89ca78",
        },
      }
    end,
  },
  "szw/vim-maximizer", -- maximizes and restores current window
}
