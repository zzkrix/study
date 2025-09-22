package main

import (
	"gorm.io/driver/mysql"
	"gorm.io/gen"
	"gorm.io/gen/field"
	"gorm.io/gorm"
	"gorm.io/gorm/logger"
)

func InitDB() *gorm.DB {
	// 连接数据库
	db, err := gorm.Open(
		mysql.Open("root:123456@tcp(127.0.0.1:3306)/testdb?charset=utf8mb4&parseTime=True&loc=Local"),
		&gorm.Config{
			Logger: logger.Default.LogMode(logger.Info),
		})
	if err != nil {
		panic(err)
	}

	return db
}

// 生成器配置
func main() {
	// 创建生成器
	g := gen.NewGenerator(gen.Config{
		OutPath:      "../dal/query", // 查询代码输出路径
		ModelPkgPath: "../dal/model", // model包路径
		Mode:         gen.WithoutContext | gen.WithDefaultQuery | gen.WithQueryInterface,
	})

	g.UseDB(InitDB())

	// 配置用户表 - 添加与角色的多对多关联
	user := g.GenerateModel("sys_user",
		// gen.FieldRename("uid", "UID"), // 如果下面的field.GormTag使用大写UID，加上这行。
		gen.FieldRelate(field.Many2Many, "Roles", g.GenerateModel("sys_role"), &field.RelateConfig{
			GORMTag: field.GormTag{
				"many2many":      []string{"sys_user_role"},
				"foreignKey":     []string{"uid"}, // 这里可以指定使用的外键。不指定默认使用主键。
				"joinForeignKey": []string{"user_id"},
				"references":     []string{"rid"}, // 这里可以指定使用的外键。不指定默认使用主键。
				"joinReferences": []string{"role_id"},
			},
		}),
	)

	// 配置角色表 - 添加与用户的多对多关联
	role := g.GenerateModel("sys_role",
		gen.FieldRelate(field.Many2Many, "Users", user, &field.RelateConfig{
			GORMTag: field.GormTag{
				"many2many":      []string{"sys_user_role"},
				"foreignKey":     []string{"rid"}, // 这里可以指定使用的外键。不指定默认使用主键。
				"joinForeignKey": []string{"role_id"},
				"references":     []string{"uid"}, // 这里可以指定使用的外键。不指定默认使用主键。
				"joinReferences": []string{"user_id"},
			},
		}),
	)

	// 生成中间表（可选）
	userRole := g.GenerateModel("sys_user_role")

	// 应用配置
	g.ApplyBasic(user, role, userRole)

	// 执行生成
	g.Execute()
}
