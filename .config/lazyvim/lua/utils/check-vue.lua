local Util = require("lazyvim.util")
local Job = require("plenary.job")

local M = {}

function M.isVueVersion3()
  local file = Util.root() .. "/package.json"
  -- print(vim.fn.filereadable(file))
  if vim.fn.filereadable(file) ~= 1 then
    return false
  end

  local found = false
  -- run ripgrep looking vue or nuxt version 3
  Job
    :new({
      command = "rg",
      args = { '("vue":\\s*"\\^?3)|("nuxt":\\s*"\\^?3)', file },
      cwd = Util.root(),
      enabled_recording = true,
      on_stdout = function(_, result)
        if result ~= nil then
          -- Util.notify("found")
          found = true
        end
      end,
    })
    :sync()
  return found
end
return M
