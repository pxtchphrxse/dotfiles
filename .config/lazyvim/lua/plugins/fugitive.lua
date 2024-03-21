return {
  {
    "tpope/vim-fugitive",
    lazy = true,
    cmd = { "Gdiffsplit", "Gvdiffsplit" },
    keys = {
      { "<leader>gd", "<cmd>Gvdiffsplit!<cr>", desc = "Diff Split & Merge conflict" },
      { "<leader>gD", "<cmd>Gdiffsplit!<cr>", desc = "Diff Split & Merge conflict (Horizontal)" },
    },
  },
}
