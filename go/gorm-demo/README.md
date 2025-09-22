## 介绍

gorm gen & 外键 使用示例

## 运行

将 init.sql 导入mysql数据库 testdb 。

```bash
cd gen && go run gen.go
```

```bash
go run -trimpath main.go

=========================================

2025/09/22 11:07:08 ./main.go:46
[1.066ms] [rows:1] SELECT * FROM `sys_user` WHERE `sys_user`.`uid` = 'u_1001' ORDER BY `sys_user`.`id` LIMIT 1
{"id":1,"uid":"u_1001","roles":null}
--------------------------------------------

2025/09/22 11:07:08 ./main.go:54
[0.636ms] [rows:2] SELECT * FROM `sys_user_role` WHERE `sys_user_role`.`user_id` = 'u_1001'

2025/09/22 11:07:08 ./main.go:54
[5.422ms] [rows:2] SELECT * FROM `sys_role` WHERE `sys_role`.`rid` IN ('r_2001','r_2002')

2025/09/22 11:07:08 ./main.go:54
[7.139ms] [rows:1] SELECT * FROM `sys_user` WHERE `sys_user`.`uid` = 'u_1001' ORDER BY `sys_user`.`id` LIMIT 1
{"id":1,"uid":"u_1001","roles":[{"id":1,"rid":"r_2001","role_name":"超级管理员","users":null},{"id":2,"rid":"r_2002","role_name":"普通用户","users":null}]}
```
