return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    opts = {
      provider = "ollama",
      ollama = {
        endpoint = "http://127.0.0.1:11434",
        model = "hhao/qwen2.5-coder-tools:1.5b",
      },
      vendors = {

        openrouter = {
          __inherited_from = "openai",
          endpoint = "https://openrouter.ai/api/v1",
          api_key_name = "OPENROUTER_API_KEY",
          model = "deepseek/deepseek-r1-zero:free",
        },
      },
    },
    file_selector = {
      provider = "fzf",
      -- Options override for custom providers
      provider_opts = {},
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make BUILD_FROM_SOURCE=true",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "ibhagwan/fzf-lua", -- for file_selector provider fzf
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
      -- {
      --   "saghen/blink.cmp",
      --   dependencies = { "Kaiser-Yang/blink-cmp-avante" },
      --   opts = {
      --     sources = {
      --       -- Add 'avante' to the list
      --       default = { "avante", "lsp", "path", "luasnip", "buffer" },
      --       providers = {
      --         avante = {
      --           module = "blink-cmp-avante",
      --           name = "Avante",
      --           opts = {
      --             -- options for blink-cmp-avante
      --           },
      --         },
      --       },
      --     },
      --   },
      -- },
    },
  },
  {
    "saghen/blink.compat",
    -- use the latest release, via version = '*', if you also use the latest release for blink.cmp
    version = "*",
    -- lazy.nvim will automatically load the plugin when it's required by blink.cmp
    lazy = true,
    -- make sure to set opts so that lazy.nvim calls blink.compat's setup
    opts = {},
  },
  {
    "saghen/blink.cmp",
    opts = {
      sources = {
        default = {
          "avante_commands",
          "avante_mentions",
          "avante_files",
        },
        providers = {
          avante_commands = {
            name = "avante_commands",
            module = "blink.compat.source",
            score_offset = 90, -- show at a higher priority than lsp
            opts = {},
          },
          avante_files = {
            name = "avante_files",
            module = "blink.compat.source",
            score_offset = 100, -- show at a higher priority than lsp
            opts = {},
          },
          avante_mentions = {
            name = "avante_mentions",
            module = "blink.compat.source",
            score_offset = 1000, -- show at a higher priority than lsp
            opts = {},
          },
        },
      },
    },
  },
}
