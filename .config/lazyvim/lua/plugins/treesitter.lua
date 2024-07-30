return {
  {
    "nvim-treesitter/nvim-treesitter",
    init = function()
      -- enable html parser for handlebars files
      vim.cmd("autocmd BufRead,BufNewFile *.hbs set filetype=html")
    end,
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, {
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
        })
      end
    end,
  },
}
