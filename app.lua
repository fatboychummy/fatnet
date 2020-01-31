--###############################################
-- Fat Server Application
--###############################################


local lapis = require("lapis")
local config = require("lapis.config").get()
local respond_to = require("lapis.application").respond_to


local app = lapis.Application()
app:enable("etlua")
app.layout = require("views.layout.layout")

app:match("index", "/", respond_to({
  GET = function(self)
    return {render = "index"}
  end
}))

app:match("TODO", "/todo", respond_to({
  GET = function(self)
    return {render = "todo"}
  end
}))

--[[
  HANDLE 404 ERRORS WHEN THERE THE PAGE DOESN'T EXIST
]]
function app:handle_404()
  return {render = "error_404"}
end

return app
