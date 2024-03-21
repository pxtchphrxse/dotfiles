return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- disable unused default
      keys[#keys + 1] = { "<leader>cl", false }
      keys[#keys + 1] = { "gI", false }
      keys[#keys + 1] = { "gy", false }
      keys[#keys + 1] = { "gK", false }
      keys[#keys + 1] = { "<C-k>", false }
      keys[#keys + 1] = { "<leader>ca", false }
      keys[#keys + 1] = { "<leader>cc", false }
      keys[#keys + 1] = { "<leader>cC", false }

      -- custom keys
      keys[#keys + 1] = { "gf", "<cmd>Lspsaga finder<cr>", desc = "Lsp Finder" }
      keys[#keys + 1] = { "gd", "<cmd>Lspsaga goto_definition<cr>", desc = "Go to Definition" }
      keys[#keys + 1] = { "gD", "<cmd>Lspsaga peek_definition<CR>", desc = "Peek Definition" }
      keys[#keys + 1] = { "go", "<cmd>Lspsaga outline<cr>", desc = "Lsp Outline" }
      keys[#keys + 1] = { "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", desc = "Signature help" }
      keys[#keys + 1] = { "K", "<cmd>Lspsaga hover_doc<CR>", desc = "Hover" }
      keys[#keys + 1] = { "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", desc = "Implementation" }
      keys[#keys + 1] = { "gr", "<cmd>lua vim.lsp.buf.references()<CR>", desc = "Peek References" }
      keys[#keys + 1] = { "<leader>ca", "<cmd>Lspsaga code_action<CR>", desc = "Code Action" }
      keys[#keys + 1] = { "gl", "<cmd>Lspsaga show_line_diagnostics<CR>", desc = "Line Diagnostics" }
      keys[#keys + 1] = { "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", desc = "Jump Previous" }
      keys[#keys + 1] = { "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", desc = "Jump Next" }
      keys[#keys + 1] = { "<leader>la", "<cmd>Lspsaga code_action<CR>", desc = "Code Action" }
      keys[#keys + 1] = { "<leader>ld", "<cmd>Telescope lsp_document_diagnostics<cr>", desc = "Document Diagnostics" }
      keys[#keys + 1] = { "<leader>lw", "<cmd>Telescope lsp_workspace_diagnostics<cr>", desc = "Document Diagnostics" }
      keys[#keys + 1] = { "<leader>li", "<cmd>LspInfo<cr>", desc = "Lsp Info" }
      keys[#keys + 1] = { "<leader>lI", "<cmd>Mason<cr>", desc = "Mason" }
      keys[#keys + 1] = { "<leader>lj", "<cmd>Lspsaga diagnostic_jump_next<cr>", desc = "Next Diagnostic" }
      keys[#keys + 1] = { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "Codelens Action" }
      keys[#keys + 1] = { "<leader>lq", "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", desc = "Quickfix" }
      keys[#keys + 1] = { "<leader>lr", "<cmd>Lspsaga rename<cr>", desc = "Rename" }
      keys[#keys + 1] = { "<leader>lR", "<cmd>LspRestart<cr>", desc = "Restart Lsp" }
      keys[#keys + 1] = { "<leader>lo", "<cmd>Lspsaga outline<cr>", desc = "Lspsaga Outline" }
      keys[#keys + 1] = { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" }
      keys[#keys + 1] = { "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols" }
      keys[#keys + 1] = { "<leader>ln", "<cmd>ConformInfo<cr>", desc = "Conform Info" }
    end,
    dependencies = { "jose-elias-alvarez/typescript.nvim" },
    opts = {
      servers = {
        tsserver = {
          keys = {
            { "<leader>lti", "<cmd>TypescriptAddMissingImports<cr>", desc = "Add Missing Imports" },
            { "<leader>lto", "<cmd>TypescriptOrganizeImports<cr>", desc = "Organize Imports" },
            { "<leader>ltu", "<cmd>TypescriptRemoveUnused<cr>", desc = "Remove Unused" },
            { "<leader>ltr", "<cmd>TypescriptRenameFile<cr>", desc = "Rename File" },
          },
        },
        eslint = {
          settings = {
            -- helps eslint find the eslintrc when it's placed in a subfolder instead of the cwd root
            workingDirectories = { mode = "auto" },
          },
        },
        tailwindcss = {},
        html = {},
        cssls = {},
        bashls = {},
        dockerls = {},
        prismals = {},
        volar = {},
        vuels = {},
      },
      setup = {
        tsserver = function(_, opts)
          require("typescript").setup({ server = opts })
          return true
        end,
        eslint = function()
          require("lazyvim.util").lsp.on_attach(function(client)
            if client.name == "eslint" then
              client.server_capabilities.documentFormattingProvider = true
            elseif client.name == "tsserver" then
              client.server_capabilities.documentFormattingProvider = false
            end
          end)

          local function get_client(buf)
            return require("lazyvim.util").lsp.get_clients({ name = "eslint", bufnr = buf })[1]
          end

          local formatter = require("lazyvim.util").lsp.formatter({
            name = "eslint: lsp",
            primary = false,
            priority = 200,
            filter = "eslint",
          })

          -- Use EslintFixAll on Neovim < 0.10.0
          if not pcall(require, "vim.lsp._dynamic") then
            formatter.name = "eslint: EslintFixAll"
            formatter.sources = function(buf)
              local client = get_client(buf)
              return client and { "eslint" } or {}
            end
            formatter.format = function(buf)
              local client = get_client(buf)
              if client then
                local diag = vim.diagnostic.get(buf, { namespace = vim.lsp.diagnostic.get_namespace(client.id) })
                if #diag > 0 then
                  vim.cmd("EslintFixAll")
                end
              end
            end
          end

          -- register the formatter with LazyVim
          require("lazyvim.util").format.register(formatter)
        end,
        -- use volar on vue 3 only otherwise use vuels
        volar = function(_, opts)
          opts.autostart = require("utils.check-vue").isVueVersion3()
        end,
        vuels = function(_, opts)
          opts.autostart = not require("utils.check-vue").isVueVersion3()
        end,
      },
    },
  },
}
