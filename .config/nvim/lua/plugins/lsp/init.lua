return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason.nvim",
      "jose-elias-alvarez/typescript.nvim",
      { "folke/neodev.nvim", config = {} },
      "b0o/SchemaStore.nvim",
    },
    config = function()
      require("plugins.lsp.config")
    end,
  },
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    dependencies = { "williamboman/mason-lspconfig.nvim", "WhoIsSethDaniel/mason-tool-installer.nvim" },
    config = function()
      require("plugins.lsp.mason")
    end,
  },
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    dependencies = {
      { "nvim-tree/nvim-web-devicons", name = "nvim-tree-devicons" },
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("plugins.lsp.saga")
    end,
  },
}
