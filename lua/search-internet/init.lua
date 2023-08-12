-- Figure out which os I'm in
-- call command to open the browser with some path
local P = require('for_deving').P

local os_to_cmd = {
  darwin = "open",
}

local urlEncode = function(s)
  -- @todo make this work more good
  return string.gsub(s, ' ', '+')
end


-- @TODO set a default somewhere perhaps a `settings` variable or something
local engines = {
  ddg = {
    addr = "https://duckduckgo.com",
    qs = function(s)
      local ready = urlEncode(s)
      return table.concat({ '/', '?q=', ready })
    end
  }
}

local determined_os = string.lower(vim.loop.os_uname().sysname)
-- @TODO: get this from some place
local determined_eng = engines.ddg

-- [[ User Facing Interface ]]
local browse = function(input)
  local cmd = os_to_cmd[determined_os]
  local actualUrl = determined_eng.addr .. determined_eng.qs(input)

  -- what are the failure modes here?
  vim.fn.jobstart({ cmd, actualUrl })
end

local word_under_cursor = function()
  local input = vim.fn.expand("<cword>")
  browse(input)
end

local selection = function()
  local input = vim.fn.getreg("*")
  browse(input)
end

local M = {
  browse = browse,
  word_under_cursor = word_under_cursor,
  selection = selection
}

return M
