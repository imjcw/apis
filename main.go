package main

import (
	"github.com/gin-gonic/gin"
)

func setupRouter() *gin.Engine {
	gin.DisableConsoleColor()
	r := gin.Default()
	r.Static("/calendar", "./files/calendar")
	return r
}

func main() {
	r := setupRouter()
	r.Run(":8080")
}
