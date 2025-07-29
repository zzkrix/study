local M = {}

-- 属于M内的方法，可以在当前文件外被调用
function M.Say(s)
	print("in subdir/foo.lua, " .. s)
end

return M
