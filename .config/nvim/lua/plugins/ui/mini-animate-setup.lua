local mouse_scrolled = false
for _, scroll in ipairs({ "Up", "Down" }) do
  local key = "<ScrollWheel" .. scroll .. ">"
  vim.keymap.set({ "", "i" }, key, function()
    mouse_scrolled = true
    return key
  end, { expr = true })
end

local animate = require("mini.animate")
local opts = {
  cursor = {
    timing = animate.gen_timing.linear({ duration = 70, unit = "total" }),
  },
  resize = {
    timing = animate.gen_timing.linear({ duration = 50, unit = "total" }),
  },
  scroll = { enable = false },
  open = { enable = false },
  close = { enable = false },
}

animate.setup(opts)
