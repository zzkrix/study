package main

import (
	"embed"
	"io/fs"
	"net/http"

	"github.com/gin-gonic/gin"
)

//go:embed static/*
var staticFiles embed.FS

func main() {
	r := gin.Default()

	// 设置静态文件服务
	staticContent, _ := fs.Sub(staticFiles, "static")
	r.NoRoute(func(c *gin.Context) {
		http.FileServer(http.FS(staticContent)).ServeHTTP(c.Writer, c.Request)
	})

	// 创建 API 路由组
	api := r.Group("/api")
	{
		api.GET("/hello", func(c *gin.Context) {
			c.JSON(200, gin.H{
				"message": "Hello from backend!",
			})
		})
	}

	r.Run(":8080")
}
