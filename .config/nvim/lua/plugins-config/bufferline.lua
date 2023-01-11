local M = {}

function M.setup()
	local status_ok, bufferline = pcall(require, "bufferline")
	if not status_ok then
		return
	end

	bufferline.setup({
		options = {
			diagnostics = "nvim_lsp",
			diagnostics_update_in_inset = false,
			persist_buffer_sort = true,
			sort_by = "id",
		},
	})
end

return M
