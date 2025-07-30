require("require_init")

local function mod_case()
	-- 同级文件夹内调用
	local mymod = require("mymod")
	mymod.Say("fffff")

	-- 单层文件夹调用
	local subMod = require("modules.submod")
	subMod.Say("sub mod")

	-- 多层文件夹调用
	local foo = require("modules.subdir.foo")
	foo.Say("other")
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

	local str = "0123abc"
	print(str) -- 0123abc
	print(tonumber(str)) -- 转换失败返回nil
	print(tostring(0123)) -- 输出123，而不是 0123，因为数字0123=123
	print(#str) -- 7, #表示取变量的长度，可以是字符串、数组、table
end

function foo(a, b, c)
	return a, c
end

local function ifelse_case()
	local a = 3

	-- ~= 表示不等于
	if a ~= 3 then
		print("a != 3")
	end

	if a == 3 then
		print("a == 3")
	end

	if a < 10 then
		print("a < 10")
	elseif a > 1 then
		print("a > 1")
	else
		print("...")
	end
end

local function for_case()
	-- 从1到10，步长为2，默认不写为1
	for i = 1, 10, 2 do
		print(i) -- 输出 1，3，5，7，9
	end

	for i = 1, 10, -1 do
		print(i) -- 不输出任何内容
	end

	for i = 10, 1, -2 do
		print(i) -- 输出 10, 8, 6, ,4 ,2
	end
end

local function metatable_case()
	local t = { num = 1 }

	-- 定义一个元表
	-- 里面定义table的加操作逻辑
	local mt = {
		__add = function(a, b)
			return a.num + b
		end,
	}

	-- 设置t的元表
	setmetatable(t, mt)

	print(t + 1) -- 输出2
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

	print("===========================")
	local i, j = foo(111, 222, 333)
	print(i)
	print(j)

	local x = foo(1, 2, 3)
	print(x) -- 默认只取第一个返回值，输出1
	print(type(foo(11, 22, 33))) -- number
	print(foo(11, 22, 33)) -- 11 33

	print("===========================")
	ifelse_case()

	print("===========================")
	for_case()

	print("===========================")
	metatable_case()
end

main()
