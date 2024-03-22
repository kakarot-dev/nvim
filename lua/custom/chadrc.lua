---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "nightowl",
  transparency = true,
  statusline = {
    theme = "default",
  },
}

M.plugins = "custom.plugins"

M.mappings = require "custom.mappings"

return M
