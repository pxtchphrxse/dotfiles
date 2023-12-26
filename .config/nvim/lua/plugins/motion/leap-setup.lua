local M = {}

M.setup = function(opts)
  local leap = require("leap")
  for k, v in pairs(opts) do
    leap.opts[k] = v
  end
  leap.add_default_mappings(true)
  vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" }) -- dimmed target in lightspeed-style
  vim.keymap.del({ "x", "o" }, "x")
  vim.keymap.del({ "x", "o" }, "X")
end

return M
