return {
  "tpope/vim-repeat", -- more capability of repeating (improve other plugins & more complex command)

  -- surround
  { "echasnovski/mini.surround", enabled = false },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end,
  },

  -- jump
  { "folke/flash.nvim", enabled = false },
  {
    "ggandor/leap.nvim",
    config = function()
      vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" }) -- dimmed target in lightspeed-style
      vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward-to)")
      vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-backward-to)")
      vim.keymap.set({ "n", "x", "o" }, "gS", "<Plug>(leap-from-window)")
    end,
  },
  {
    "ggandor/flit.nvim",
    dependencies = { "ggandor/leap.nvim" },
    opts = { labeled_modes = "nv", keys = { f = "f", F = "F", t = "t", T = "T" } },
  },
}
