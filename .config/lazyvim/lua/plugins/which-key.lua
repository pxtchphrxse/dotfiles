return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  -- Override Label
  opts = function()
    return {
      plugins = { spelling = true },
      window = {
        border = "single", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0,
      },
      -- defaults = {
      --   mode = { "n", "v" },
      --   ["g"] = { name = "+goto" },
      --   ["gs"] = { name = "+surround" },
      --   ["z"] = { name = "+fold" },
      --   ["]"] = { name = "+next" },
      --   ["["] = { name = "+prev" },
      --   ["<leader><tab>"] = { name = "+tabs" },
      --   ["<leader>b"] = { name = "+buffer" },
      --   ["<leader>c"] = { name = "+code" },
      --   ["<leader>f"] = { name = "+file/find" },
      --   ["<leader>g"] = { name = "+git" },
      --   ["<leader>gh"] = { name = "+hunks" },
      --   -- ["<leader>q"] = { name = "Quit" },
      --   ["<leader>s"] = { name = "+search" },
      --   ["<leader>u"] = { name = "+ui" },
      --   ["<leader>l"] = { name = "LSP" },
      --   ["<leader>lt"] = { name = "typescript" },
      --   -- ["<leader>w"] = { name = "Save" },
      --   -- ["<leader>x"] = { name = "Close Buffer" },
      -- },
    }
  end,
  config = function()
    local wk = require("which-key")
    wk.add({
      mode = { "n", "v" },
      { "<leader><tab>", group = "tabs" },
      { "<leader>b", group = "buffer" },
      { "<leader>c", group = "code" },
      { "<leader>f", group = "file/find" },
      { "<leader>g", group = "git" },
      { "<leader>gh", group = "hunks" },
      { "<leader>l", group = "LSP" },
      { "<leader>lt", group = "typescript" },
      { "<leader>s", group = "search" },
      { "<leader>u", group = "ui" },
      { "[", group = "prev" },
      { "]", group = "next" },
      { "g", group = "goto" },
      { "gs", group = "surround" },
      { "z", group = "fold" },
      { "<leader>d", hidden = true },
      { "<leader>D", hidden = true },
    })
  end,
}
