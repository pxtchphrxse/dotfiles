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
  },
}
