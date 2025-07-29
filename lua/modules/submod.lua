local M = {}

-- 必须定义在使用之前，否则报错
-- 本地函数，只能在当前文件内被调用
local function sayHello(s)
	print("in private sayHello, s is: " .. s)
end

-- 属于M内的方法，可以在当前文件外被调用
function M.Say(s)
	print("in module.Say, s is: " .. s)
	sayHello(s)
end

return M
