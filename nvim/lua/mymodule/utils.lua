-- In a file like ~/.config/nvim/lua/myfunctions.lua
local M = {} -- M is a table to hold public functions for the module

local os_name = vim.loop.os_uname().sysname

M.is = {
  windows = (os_name == "Windows"),
  linux = (os_name == "Linux"),
  mac = (os_name == "Darwin"),
}

M.get_name = function()
  return os_name
end

return M -- Return the public interface
