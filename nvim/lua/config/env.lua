--- Environment helpers shared by plugin specs (loaded before Lazy resolves plugins).
local M = {}

--- True when this Neovim runs inside an SSH session (typical on remote servers).
function M.remote_ssh_session()
  return vim.env.SSH_CONNECTION ~= nil or vim.env.SSH_CLIENT ~= nil
end

return M
