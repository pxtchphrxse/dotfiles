return {
  "nvimdev/lspsaga.nvim",
  event = "LspAttach",
  config = function()
    require("lspsaga").setup({
      ui = {
        border = "rounded",
      },
      symbol_in_winbar = {
        enable = true,
        separator = "  ",
        hide_keyword = true,
        show_file = false,
        folder_level = 1,
        color_mode = true,
        delay = 100,
      },
      code_action = {
        num_shortcut = true,
        show_server_name = true,
        keys = {
          quit = "q",
          exec = "<CR>",
        },
      },
      finder = {
        keys = {
          open = "o",
          edit = { "e", "<CR>" },
          vsplit = "v",
          split = "s",
          tabe = "t",
          quit = { "q", "<ESC>" },
        },
      },
      diagnostic = {
        show_code_action = true,
        jump_num_shortcut = true,
      },
      lightbulb = {
        enable = false,
        enable_on_insert = false,
        sign = true,
        sign_priority = 40,
        virtual_text = true,
      },
      outline = {
        win_position = "right",
        win_with = "",
        win_width = 30,
        show_detail = true,
        auto_preview = true,
        auto_refresh = true,
        auto_close = true,
        custom_sort = nil,
        keys = {
          jump = "o",
          expand_collapse = "u",
          quit = "q",
        },
      },
      rename = {
        keys = {
          quit = "<C-c>",
          exec = "<CR>",
        },
      },
    })
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
}
