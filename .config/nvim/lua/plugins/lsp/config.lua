return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		config = function(_, opts)
			for server, server_opts in pairs(opts.servers) do
				if type(server_opts) == "table" and server_opts.keys then
					require("utils").set_lsp_keymaps({ name = server ~= "*" and server or nil }, server_opts.keys)
				end

				vim.lsp.config(server, server_opts)
				vim.lsp.enable(server)
			end
		end,
		keys = {
			{ "gf", "<cmd>Lspsaga finder<cr>", desc = "Lsp Finder" },
			{ "gd", "<cmd>Lspsaga goto_definition<cr>", desc = "Go to Definition" },
			{ "gD", "<cmd>Lspsaga peek_definition<CR>", desc = "Peek Definition" },
			{ "go", "<cmd>Lspsaga outline<cr>", desc = "Lsp Outline" },
			{ "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", desc = "Signature help" },
			{ "K", "<cmd>Lspsaga hover_doc<CR>", desc = "Hover" },
			{ "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", desc = "Implementation" },
			{ "gr", "<cmd>lua vim.lsp.buf.references()<CR>", desc = "Peek References" },
			{ "<leader>ca", "<cmd>Lspsaga code_action<CR>", desc = "Code Action" },
			{ "gl", "<cmd>Lspsaga show_line_diagnostics<CR>", desc = "Line Diagnostics" },
			{ "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", desc = "Jump Previous" },
			{ "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", desc = "Jump Next" },
			{ "<leader>la", "<cmd>Lspsaga code_action<CR>", desc = "Code Action" },
			{
				"<leader>ld",
				function()
					Snacks.picker.diagnostics_buffer()
				end,
				desc = "Document Diagnostics",
			},
			{
				"<leader>lw",
				function()
					Snacks.picker.diagnostics()
				end,
				desc = "Document Diagnostics",
			},
			{ "<leader>li", "<cmd>LspInfo<cr>", desc = "Lsp Info" },
			{ "<leader>lI", "<cmd>Mason<cr>", desc = "Mason" },
			{ "<leader>lj", "<cmd>Lspsaga diagnostic_jump_next<cr>", desc = "Next Diagnostic" },
			{ "<leader>lk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", desc = "Previous Diagnostic" },
			{ "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "Codelens Action" },
			{ "<leader>lq", "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", desc = "Quickfix" },
			{ "<leader>lr", "<cmd>Lspsaga rename<cr>", desc = "Rename" },
			{ "<leader>lR", "<cmd>LspRestart<cr>", desc = "Restart Lsp" },
			{ "<leader>lo", "<cmd>Lspsaga outline<cr>", desc = "Lspsaga Outline" },
			{
				"<leader>ls",
				function()
					Snacks.picker.lsp_symbols()
				end,
				desc = "Document Symbols",
			},
			{
				"<leader>lS",
				function()
					Snacks.picker.lsp_workspace_symbols()
				end,
				desc = "Workspace Symbols",
			},
			{ "<leader>ln", "<cmd>ConformInfo<cr>", desc = "Conform Info" },
		},
	},
}
