local LUA_VERSION = "5.4"

-- 安装第三方依赖到本地文件夹
-- luarocks install lua-cjson --tree ./thirdlibs

-- 设置 Lua 模块搜索路径（查找 .lua 文件）
package.path = table.concat({
	"./thirdlibs/share/lua/" .. LUA_VERSION .. "/?.lua",
	"./thirdlibs/share/lua/" .. LUA_VERSION .. "/?/init.lua",
	"./?.lua",
	"./?/init.lua",
	package.path,
}, ";")

-- 设置 C 模块搜索路径（查找 .so 文件）
package.cpath = table.concat({
	"./thirdlibs/lib/lua/" .. LUA_VERSION .. "/?.so",
	package.cpath,
}, ";")
