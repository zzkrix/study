-- 安装依赖到当前项目路径下
-- luarocks install lua-cjson --tree ./thirdlibs

require("require_init")

local cjson = require("cjson")

-- Lua 表编码为 JSON 字符串
local lua_table = {
	name = "Alice",
	age = 30,
	active = true,
	skills = { "Lua", "Python" },
}

local json_str = cjson.encode(lua_table)
print(json_str) -- 输出: {"name":"Alice","age":30,"active":true,"skills":["Lua","Python"]}

-- JSON 字符串解码为 Lua 表
local json_text = '{"project":"Lua","stars":5}'
local data = cjson.decode(json_text)
print(data.project) -- 输出: Lua
