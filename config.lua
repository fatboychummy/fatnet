local config = require("lapis.config")

config("dev", {
  greeting = "Testing Testing 123",
  port = 8080,
  lua_code_cache = "off",
})
