-- ############### 类的定义 ###############
-- 定义类，可以有默认属性，如addr。 也可以在构造函数内动态添加
local Person = { addr = "default: beijing" }

function Person:new(name, age) -- 定义必须用 :
	-- 固定的必须写的部分
	local obj = {}
	setmetatable(obj, self)
	self.__index = self

	-- >>>>>>>>>>>>>> 自定义初始化部分
	obj.name = name -- 注意这里是obj
	obj.age = age
	-- <<<<<<<<<<<<<< 自定义初始化部分

	-- 固定的必须写的部分
	return obj -- 注意这里是obj
end

function Person:showInfo() -- 定义必须用 :
	print("name: " .. self.name)
	print("age: " .. self.age)
	print("addr: " .. self.addr)
end

print("p1: -----")
local p1 = Person:new("zhangsan", 99) -- 初始化必须用:
p1:showInfo() -- 调用方法必须用 :

print("p2: -----")
local p2 = Person:new("lisi", 98)
p2:showInfo()

print("p1.name=" .. p1.name) -- 调用属性用 .

print("############### 类的继承 ###############")
local Student = Person:new()

function Student:new(name, age, phone)
	-- 固定的必须写的部分
	local obj = {}
	setmetatable(obj, self)
	self.__index = self

	-- >>>>>>>>>>>>>> 自定义初始化部分
	obj.name = name
	obj.age = age
	obj.phone = phone
	-- <<<<<<<<<<<<<< 自定义初始化部分

	-- 固定的必须写的部分
	return obj
end

function Student:foo()
	-- 直接调用父类的方法
	self:showInfo()

	-- print("name: " .. self.name)
	-- print("age: " .. self.age)
	-- print("addr: " .. self.addr)
	print("phone: " .. self.phone)
end

print("s1: -----")
local s1 = Student:new("xiaoming", 6, "123456")
s1.age = s1.age + 1
s1:foo()

print("s2: -----")
local s2 = Student:new("lucy", 8, "999999")
s2:foo()
