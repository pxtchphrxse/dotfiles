return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		local util = require("conform.util")

		conform.setup({
			formatters = {
				eslint_d = {
					cwd = util.root_file({ ".eslintrc", ".eslintrc.js", ".eslintrc.json", ".eslintrc.cjs" }),
					require_cwd = true,
				},
			},
			formatters_by_ft = {
				javascript = { { "eslint_d", "prettier" } },
				typescript = { { "eslint_d", "prettier" } },
				javascriptreact = { { "eslint_d", "prettier" } },
				typescriptreact = { { "eslint_d", "prettier" } },
				vue = { { "eslint_d", "prettier" } },
				svelte = { { "eslint_d", "prettier" } },
				astro = { { "eslint_d", "prettier" } },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
				sh = { "beautysh" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			},
		})

		vim.api.nvim_create_user_command("Format", function(args)
			local range = nil
			if args.count ~= -1 then
				local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
				range = {
					start = { args.line1, 0 },
					["end"] = { args.line2, end_line:len() },
				}
			end
			require("conform").format({ async = true, lsp_fallback = true, range = range })
		end, { range = true })
	end,
}
