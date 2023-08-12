-- Figure out which os I'm in
-- call command to open the browser with some path
local P = require('for_deving').P

local os_to_cmd = {
  darwin = "open",
}

-- @TODO set a default somewhere perhaps a `settings` variable or something
local engines = {
  ddg = "https://duckduckgo.com"
}

-- @TODO: get this form some place
local determined_os = "darwin"

local browse = function(url)
  local cmd = os_to_cmd[determined_os]
  -- local cmd = 'echo'
  vim.fn.jobstart({ cmd, url }, {
    on_stdout = function(j, d, e)
      P('xhere')
      P(d)
      P(e)
    end
  })
end


-- @TODO:
--  1 ~come up with order of precedence perhaps something like:~
--    instead of order of precedence, the function should take a search term
--    and then do the search.
--    the settinsgs should figure out what the term is
--      visual selected
--      word under curosr
--      clipboard
--      etc
--  2 create url encoded string from query stuff
--    each engine would have to follow some interface or something
--  3 pass that url into the `browse` function
--  4 profit
local M = { browse = browse }

return M
