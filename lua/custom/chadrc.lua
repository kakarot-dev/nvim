---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "ayu_dark",
  --transparency = true,
  statusline = {
    theme = "default",
  },
}

M.plugins = "custom.plugins"

M.mappings = require "custom.mappings"

return M
