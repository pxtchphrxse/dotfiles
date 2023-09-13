local status, null_ls = pcall(require, "null-ls")
if not status then
	return
end
local u = require("null-ls.utils")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local lsp_formatting = function(bufnr, async)
	vim.lsp.buf.format({
		filter = function(client)
			-- only format with null-ls
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
		async = async,
	})
end

local prettier_filetypes = {
	"javascript",
	"javascriptreact",
	"typescript",
	"typescriptreact",
	"vue",
	"css",
	"scss",
	"less",
	"html",
	"json",
	"jsonc",
	"yaml",
	"markdown",
	"markdown.mdx",
	"graphql",
	"handlebars",
	"svelte",
}

null_ls.setup({
	root_dir = u.root_pattern(".null-ls-root", "Makefile", "node_modules", ".git"),
	sources = {
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.stylua,
		diagnostics.flake8,
		formatting.sql_formatter,
		formatting.beautysh,
		formatting.prettier.with({
			filetypes = prettier_filetypes,
			condition = function(utils)
				-- force prettier to format svelte (not eslint_d)
				if vim.bo.filetype == "svelte" then
					return true
				end
				return not utils.root_has_file({ ".eslintrc", ".eslintrc.js", ".eslintrc.json", ".eslintrc.cjs" })
			end,
		}),
		formatting.eslint_d.with({
			filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
			condition = function(utils)
				return utils.root_has_file({ ".eslintrc", ".eslintrc.js", ".eslintrc.json", ".eslintrc.cjs" })
			end,
		}),
		diagnostics.eslint_d.with({
			filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte" },
			-- ignore prettier warnings from eslint-plugin-prettier
			-- filter = function(diagnostic)
			-- 	return diagnostic.code ~= "prettier/prettier"
			-- end,
			-- extra_args = { "--ignore-patterns", "node_modules" },
			condition = function(utils)
				return utils.root_has_file({ ".eslintrc", ".eslintrc.js", ".eslintrc.json", ".eslintrc.cjs" })
			end,
		}),
		-- code_actions.eslint_d.with({
		-- 	filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
		-- 	condition = function(utils)
		-- 		return utils.root_has_file({ ".eslintrc", ".eslintrc.js", ".eslintrc.json", ".eslintrc.cjs" })
		-- 	end,
		-- }),
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_buf_create_user_command(bufnr, "Format", function()
				lsp_formatting(bufnr, true)
			end, { force = true })

			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					lsp_formatting(bufnr)
				end,
			})
		end
	end,
})
