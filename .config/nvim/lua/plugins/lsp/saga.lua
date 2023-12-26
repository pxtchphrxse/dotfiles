local status, saga = pcall(require, "lspsaga")
if not status then
  return
end

saga.setup({
  ui = {
    border = "rounded",
  },
  symbol_in_winbar = {
    enable = true,
    separator = "  ",
    ignore_patterns = {},
    hide_keyword = true,
    show_file = false,
    folder_level = 2,
    respect_root = false,
    color_mode = true,
    delay = 500,
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
  code_action = {
    num_shortcut = true,
    show_server_name = true,
    keys = {
      quit = "q",
      exec = "<CR>",
    },
  },
  lightbulb = {
    enable = true,
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
