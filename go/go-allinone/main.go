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

	// 将 embed.FS 转为 http.FS，挂载到根路径 /
	staticContent, _ := fs.Sub(staticFiles, "static")
	r.StaticFS("/", http.FS(staticContent))

	r.Run(":8080")
}
