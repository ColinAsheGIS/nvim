
local M = {}

function M.remap(mode, keys ,func, opts)
  vim.keymap.set(mode, keys, func, opts)
end

return M
