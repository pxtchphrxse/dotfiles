return {
  {
    "stevearc/conform.nvim",
    keys = {
      {
        "<leader>lf",
        function()
          LazyVim.format({ force = true })
        end,
        desc = "Format",
      },
      {
        "<leader>lF",
        function()
          require("conform").format({ formatters = { "injected" }, timeout_ms = 3000 })
        end,
        mode = { "n", "v" },
        desc = "Format Injected Langs",
      },
    },
    init = function()
      -- Install the conform formatter on VeryLazy
      LazyVim.on_very_lazy(function()
        LazyVim.format.register({
          name = "conform.nvim",
          priority = 100,
          primary = true,
          format = function(buf)
            local plugin = require("lazy.core.config").plugins["conform.nvim"]
            local Plugin = require("lazy.core.plugin")
            local opts = Plugin.values(plugin, "opts", false)

            -- if eslint fixAll is active, do not format buffer with conform
            for _, formatter in ipairs(LazyVim.format.resolve(buf)) do
              if
                #formatter.resolved > 0
                and (formatter.name == "eslint: EslintFixAll" or formatter.name == "eslint: lsp")
              then
                return
              end
            end
            require("conform").format(LazyVim.merge(opts.format, { bufnr = buf }))
          end,
          sources = function(buf)
            local ret = require("conform").list_formatters(buf)
            return vim.tbl_map(function(v)
              return v.name
            end, ret)
          end,
        })
      end)
    end,
  },
}
