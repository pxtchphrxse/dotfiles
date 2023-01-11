local path = vim.fn.getcwd()

local file = io.open(vim.fn.stdpath("config") .. "/vue3-project.txt", "r+b")
if not file then
	io.open(vim.fn.stdpath("config") .. "/vue3-project.txt", "w+b")
	file = io.open(vim.fn.stdpath("config") .. "/vue3-project.txt", "r+b")
end
local text = file:read("a")
local find = text:find(path .. "\n", 1, true)
local autostart = false
if find then
	autostart = true
end
file:close()

return {
	autostart = autostart,
}
