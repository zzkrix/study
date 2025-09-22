package main

import (
	"demo/dal/model"
	"demo/dal/query"
	"encoding/json"
	"fmt"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
	"gorm.io/gorm/logger"
)

var db *gorm.DB

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

func printObj(o interface{}) {
	b, err := json.Marshal(o)
	if err != nil {
		panic(err)
	}

	fmt.Printf("%s\n", b)
}

func main() {
	db = InitDB()
	query.SetDefault(db)

	fmt.Println("=========================================")

	// 查询用户
	{
		var user model.SysUser
		db.Where(query.SysUser.UID.Eq("u_1001")).First(&user)
		printObj(&user)
	}

	fmt.Println("--------------------------------------------")

	// 查询用户和对应的角色
	{
		var user model.SysUser
		db.Where(query.SysUser.UID.Eq("u_1001")).Preload("Roles").First(&user)
		printObj(&user)
	}
}
