local Utils = require("utils")

local prettier_supported = {
	"css",
	"graphql",
	"handlebars",
	"html",
	"json",
	"jsonc",
	"less",
	"markdown",
	"markdown.mdx",
	"scss",
	"yaml",
}
local eslint_supported = {
	"javascript",
	"javascriptreact",
	"typescript",
	"typescriptreact",
}
local formatters_by_ft = {}

for _, value in pairs(prettier_supported) do
	formatters_by_ft[value] = { "prettier" }
end

-- Helper function to check for a local config file
local function has_local_config(location, config_names)
	for _, name in pairs(config_names) do
		local found = vim.fs.find(name, { upward = true, location })
		if not (next(found) == nil) then
			return true
		end
	end
	return false
end

local eslintrc_list = {
	"eslint.config.js",
	"eslint.config.mjs",
	"eslint.config.cjs",
	".eslintrc.js",
	".eslintrc.ms",
	".eslintrc.cjs",
	".eslintrc.yaml",
	".eslintrc.yml",
	".eslintrc.json",
	".eslintrc",
}
for _, value in pairs(eslint_supported) do
	formatters_by_ft[value] = function(bufnr)
		-- Check for common ESLint config file names
		if has_local_config(bufnr, eslintrc_list) then
			-- If a config is found, fallback to eslint lsp
			return {}
		else
			-- Otherwise, you might fallback to a global formatter like "prettier"
			-- or just return an empty table to use the LSP fallback
			return { "prettier" } -- or {} to use LSP fallback
		end
	end
end

return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = formatters_by_ft,
		},
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				eslint = {
					settings = {
						-- helps eslint find the eslintrc when it's placed in a subfolder instead of the cwd root
						workingDirectories = { mode = "auto" },
						workingDirectory = { mode = "auto" },
						format = true,
						rulesCustomizations = {
							{ rule = "style/*", severity = "off", fixable = true },
							{ rule = "format/*", severity = "off", fixable = true },
							{ rule = "*-indent", severity = "off", fixable = true },
							{ rule = "*-spacing", severity = "off", fixable = true },
							{ rule = "*-spaces", severity = "off", fixable = true },
							{ rule = "*-order", severity = "off", fixable = true },
							{ rule = "*-dangle", severity = "off", fixable = true },
							{ rule = "*-newline", severity = "off", fixable = true },
							{ rule = "*quotes", severity = "off", fixable = true },
							{ rule = "*semi", severity = "off", fixable = true },
						},
					},
				},
				vtsls = {
					-- explicitly add default filetypes, so that we can extend
					-- them in related extras
					filetypes = {
						"javascript",
						"javascriptreact",
						"javascript.jsx",
						"typescript",
						"typescriptreact",
						"typescript.tsx",
					},
					settings = {
						complete_function_calls = true,
						vtsls = {
							enableMoveToFileCodeAction = true,
							autoUseWorkspaceTsdk = true,
							experimental = {
								maxInlayHintLength = 30,
								completion = {
									enableServerSideFuzzyMatch = true,
								},
							},
						},
						typescript = {
							updateImportsOnFileMove = { enabled = "always" },
							suggest = {
								completeFunctionCalls = true,
							},
							inlayHints = {
								enumMemberValues = { enabled = true },
								functionLikeReturnTypes = { enabled = true },
								parameterNames = { enabled = "literals" },
								parameterTypes = { enabled = true },
								propertyDeclarationTypes = { enabled = true },
								variableTypes = { enabled = false },
							},
						},
					},
					keys = {
						{
							"<leader>co",
							Utils.action["source.organizeImports"],
							desc = "Organize Imports",
						},
						{
							"<leader>cM",
							Utils.action["source.addMissingImports.ts"],
							desc = "Add missing imports",
						},
						{
							"<leader>cu",
							Utils.action["source.removeUnused.ts"],
							desc = "Remove unused imports",
						},
						{
							"<leader>cD",
							Utils.action["source.fixAll.ts"],
							desc = "Fix all diagnostics",
						},
						{
							"<leader>cV",
							function()
								Utils.execute({ command = "typescript.selectTypeScriptVersion" })
							end,
							desc = "Select TS workspace version",
						},
					},
				},
				tailwindcss = {},
				html = {},
				cssls = {
					settings = {
						css = { validate = false },
						scss = { validate = false },
					},
				},
			},
		},
	},
	-- Filetype icons
	{
		"nvim-mini/mini.icons",
		opts = {
			file = {
				[".eslintrc.js"] = { glyph = "󰱺", hl = "MiniIconsYellow" },
				[".node-version"] = { glyph = "", hl = "MiniIconsGreen" },
				[".prettierrc"] = { glyph = "", hl = "MiniIconsPurple" },
				[".yarnrc.yml"] = { glyph = "", hl = "MiniIconsBlue" },
				["eslint.config.js"] = { glyph = "󰱺", hl = "MiniIconsYellow" },
				["package.json"] = { glyph = "", hl = "MiniIconsGreen" },
				["tsconfig.json"] = { glyph = "", hl = "MiniIconsAzure" },
				["tsconfig.build.json"] = { glyph = "", hl = "MiniIconsAzure" },
				["yarn.lock"] = { glyph = "", hl = "MiniIconsBlue" },
			},
		},
	},
}
