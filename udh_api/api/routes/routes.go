package routes

import (
	"github.com/felipematthew/go-learnings/client-api/api/handlers"
	"github.com/felipematthew/go-learnings/client-api/api/middlewares"
	"github.com/labstack/echo/v4"
	echoSwagger "github.com/swaggo/echo-swagger"
)

func Generate(e *echo.Echo) {

	// Public
	e.GET("/swagger/*", echoSwagger.WrapHandler)
	e.GET("/ping", handlers.Ping)
	e.POST("/login", handlers.Login)
	e.POST("/createadmin", handlers.CreateAdmin)

	protected := e.Group("/api/v1")
	protected.Use(middlewares.JwtWithConfig)

	// Admin routes
	admin := protected.Group("/admin")

	admin.GET("/", handlers.GetAdmin)
	admin.DELETE("/:id", handlers.DeleteAdmin)

	// Clients routes
	client := protected.Group("/client")

	client.GET("/", handlers.GetAllClients)
	client.GET("/:id", handlers.GetByIdClient)
	client.POST("/", handlers.CreateClient)
	client.DELETE("/:id", handlers.DeleteClient)
	client.PUT("/:id", handlers.CompleteUpdateClient)
	client.PATCH("/:id", handlers.PartialUpdateClient)
}
