-- 将本地lua文件添加到lua搜索路径中
package.path = package.path .. ";" .. "./?.lua"

-- 将本地文件夹添加到lua搜索路径中
package.path = package.path .. ";" .. "./modules/"

local function mod_case()
	local mymod = require("mymod")
	mymod.Say("fffff")

	local subMod = require("modules.submod")
	subMod.Say("sub mod")
end

local function table_case()
	-- Table 操作

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
end

local function arr_case()
	-- 遍历数组
	local arr = { 11, 22, 333, "asd" }

	print(arr[0]) -- 输出nil
	print(arr[1]) -- lua数组下标从1开始

	-- #arr 取arr的长度
	for i = 1, #arr do
		print(arr[i])
	end
end

local function base_case()
	--  输出1到10
	for i = 1, 10 do
		print(i)
	end

	-- 字符串，可以用单/双引号
	local shortStr1 = "abc"
	local shortStr2 = "abc"
	local shortStr3 = "abc\neeeee"
	print(shortStr1)
	print(shortStr2)
	print(shortStr3)

	-- 也可以用 [[ some str ]] 表示，类似python里的三引号或go里面的``
	local logStr = [[ asda 
-----
	---  \n
---
---12311232 
---
---
---
---]]
	print(logStr)
end

local function main()
	print("===========================")
	mod_case()

	print("===========================")
	table_case()

	print("===========================")
	arr_case()

	print("===========================")
	base_case()
end

main()
