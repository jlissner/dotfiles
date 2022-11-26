local M = {}

function M.Run()
  local rootDir = vim.loop.cwd()
  local bufferName = vim.api.nvim_buf_get_name(0)
  local relativeBufferName = bufferName:gsub(rootDir, "")
  local command = "FloatermNew npm run test -- --testPathPattern=\"" .. relativeBufferName:gsub("\\", "/") .. "\""
  
  vim.cmd(command)
end

return M


