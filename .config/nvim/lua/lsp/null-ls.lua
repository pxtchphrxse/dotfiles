local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		formatting.black.with({ extra_args = { "--fast" } }),
		-- formatting.yapf,
		formatting.stylua,
		diagnostics.flake8,
		formatting.prettier_d_slim.with({
			-- args = { "--stdin", "--stdin-filename", "%filepath", "--format", "json" },
			condition = function(utils)
				return not utils.root_has_file({ ".eslintrc", ".eslintrc.js", ".eslintrc.json" })
			end,
		}),
		formatting.eslint_d.with({
			-- args = { "--stdin", "--stdin-filename", "%filepath", "--format", "json" },
			condition = function(utils)
				return  utils.root_has_file({ ".eslintrc", ".eslintrc.js", ".eslintrc.json" })
			end,
		}),
		diagnostics.eslint_d.with({
			-- args = { "--stdin", "--stdin-filename", "%filepath", "--format", "json" },
			condition = function(utils)
				return  utils.root_has_file({ ".eslintrc", ".eslintrc.js", ".eslintrc.json" })
			end,
		}),
	},
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd([[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
            augroup END
            ]])
		end
	end,
})
