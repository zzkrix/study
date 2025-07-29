-- 遍历数组
local arr = { 11, 22, 333, "asd" }

print(arr[0]) -- 输出nil
print(arr[1]) -- lua数组下标从1开始

-- #arr 取arr的长度
for i = 1, #arr do
	print(arr[i])
end
