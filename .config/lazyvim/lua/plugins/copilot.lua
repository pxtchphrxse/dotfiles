return {
  "zbirenbaum/copilot.lua",
  opts = function(_, opts)
    local node_path = vim.env.NVIM_COPILOT_NODE_PATH
    if node_path ~= nil or node_path ~= "" then
      opts.copilot_node_command = vim.env.NVIM_COPILOT_NODE_PATH
    end
  end,
}
