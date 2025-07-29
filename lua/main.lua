-- 将本地lua文件添加到lua搜索路径中
package.path = package.path .. ";" .. "./?.lua"

-- 将本地文件夹添加到lua搜索路径中
package.path = package.path .. ";" .. "./modules/"

print("===========================")

local mymod = require("mymod")
mymod.Say("fffff")

local subMod = require("modules.mod1")
subMod.Say("sub mod")
print("===========================")

-- 遍历数组
local arr = { 11, 22, 333, "asd" }

print(arr[0]) -- 输出nil
print(arr[1]) -- lua数组下标从1开始

-- #arr 取arr的长度
for i = 1, #arr do
	print(arr[i])
end

-- Table 操作
print("===========================")

local table1 = {}
table1["k1"] = "v1"
table1["k2"] = "v2"

-- table2 = table1 会使两个变量指向同一个对象
-- 如果希望 table2 是 table1 的副本，需要手动复制
local table2 = {}
for k, v in pairs(table1) do
	table2[k] = v
end

-- 修改 table2 的内容，不会影响 table1
table2["k1"] = "vvv"

local function printTable(tbl)
	for k, v in pairs(tbl) do
		print(k, v)
	end
end

print("table1:")
printTable(table1)

print("table2:")
printTable(table2)

print("===========================")
--  输出1到10
for i = 1, 10 do
	print(i)
end
