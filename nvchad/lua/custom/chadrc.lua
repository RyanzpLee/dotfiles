-- First read our docs (completely) then check the example_config repo

local M = {}

M.ui = {
  theme = "nightowl",
}

-- M.plugins = {
--   options = {
--     lsp_config = {
--       setup_lspconf = 'custom.lspconfig'
--     }
--   }
-- }

M.plugins = require "custom.plugins"
M.mappings = require "custom.mappings"

return M
