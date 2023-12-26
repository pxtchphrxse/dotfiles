return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = {
      { "tiagovla/scope.nvim", opts = {} }, -- show only buffers opened in tab
      { "nvim-tree/nvim-web-devicons", name = "nvim-tree-devicons" },
    },
    opts = {
      options = {
        diagnostics = "nvim_lsp",
        diagnostics_update_in_inset = false,
        persist_buffer_sort = true,
        sort_by = "id",
        right_mouse_command = ":BD",
        buffer_close_icon = "",
        offsets = {
          {
            filetype = "neo-tree",
            text = "NeoTree",
            highlight = "Directory",
          },
        },
      },
      highlights = {
        buffer_selected = {
          italic = false,
          fg = "#89ca78",
        },
      },
    },
  },
  "qpkorr/vim-bufkill", -- close buffer without close window
  "szw/vim-maximizer", -- maximizes and restores current window
}
