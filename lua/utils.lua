local M = {
  mapKeyOpts = { noremap = true, silent = true }
}

function M.mapKey(mode, lhs, rhs, opts) 
  vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

return M;
