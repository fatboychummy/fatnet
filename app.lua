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
    self.page_title = "Welcome to FatNet"
    return {render = "index"}
  end
}))

app:match("TODO", "/todo", respond_to({
  GET = function(self)
    self.page_title = "To Do List"
    return {render = "todo"}
  end
}))

--[[
  HANDLE 404 ERRORS WHEN THERE THE PAGE DOESN'T EXIST
]]
function app:handle_404()
  self.page_title = "That's an error if I've ever seen one."
  return {render = "error_404"}
end

return app
