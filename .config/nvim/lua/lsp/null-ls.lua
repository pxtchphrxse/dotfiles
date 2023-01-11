local status, null_ls = pcall(require, "null-ls")
if not status then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

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

null_ls.setup({
	sources = {
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.stylua,
		diagnostics.flake8,
		formatting.prettier.with({
			condition = function(utils)
				return not utils.root_has_file({ ".eslintrc", ".eslintrc.js", ".eslintrc.json" })
			end,
		}),
		formatting.eslint_d.with({
			-- args = { "--stdin", "--stdin-filename", "%filepath", "--format", "json" },
			condition = function(utils)
				return utils.root_has_file({ ".eslintrc", ".eslintrc.js", ".eslintrc.json" })
			end,
		}),
		diagnostics.eslint_d.with({
			-- args = { "--stdin", "--stdin-filename", "%filepath", "--format", "json" },
			condition = function(utils)
				return utils.root_has_file({ ".eslintrc", ".eslintrc.js", ".eslintrc.json" })
			end,
		}),
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_create_user_command("Format", function()
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
