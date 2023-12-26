if #vim.api.nvim_list_uis() == 0 then
  return
end

local status_ok, treesitter_configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

local context_comment_ok, ts_context_commentstring = pcall(require, "ts_context_commentstring")
if context_comment_ok then
  vim.g.skip_ts_context_commentstring_module = true
  ts_context_commentstring.setup({ enable_autocmd = false })
end

treesitter_configs.setup({
  auto_install = true,
  sync_install = false,
  on_config_done = nil,
  ensure_installed = {
    "json",
    "javascript",
    "typescript",
    "tsx",
    "yaml",
    "html",
    "css",
    "markdown",
    "markdown_inline",
    "svelte",
    "graphql",
    "bash",
    "lua",
    "vim",
    "dockerfile",
    "gitignore",
    "vue",
    "sql",
    "dockerfile",
    "prisma",
  }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = {},
  matchup = {
    enable = true, -- mandatory, false will disable the whole extension
    disable = { "c", "ruby" }, -- optional, list of language that will be disabled
  },
  highlight = {
    enable = true, -- false will disable the whole extension
    additional_vim_regex_highlighting = false,
    disable = { "latex" },
  },
  indent = { enable = true, disable = { "yaml", "python" } },
  autotag = { enable = true },
  textobjects = {
    swap = {
      enable = false,
      -- swap_next = textobj_swap_keymaps,
    },
    -- move = textobj_move_keymaps,
    select = {
      enable = false,
      -- keymaps = textobj_sel_keymaps,
    },
  },
  textsubjects = {
    enable = false,
    keymaps = { ["."] = "textsubjects-smart", [";"] = "textsubjects-big" },
  },
})
