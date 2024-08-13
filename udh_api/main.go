package main

import (
	"log"

	"github.com/felipematthew/go-learnings/client-api/api/config"
	"github.com/felipematthew/go-learnings/client-api/api/routes"
	_ "github.com/felipematthew/go-learnings/client-api/docs"
	"github.com/joho/godotenv"
	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
)

// @title Client API
// @version 1.0
// @description Essa é a API oficial do projeto Client API.
// @termsOfService http://swagger.io/terms/

// @contact.name API Support
// @contact.url http://www.swagger.io/support
// @contact.email support@swagger.io

// @license.name Apache 2.0
// @license.url http://www.apache.org/licenses/LICENSE-2.0.html

// @host localhost:8080
// @BasePath /

// @schemes https
// @Produces  application/json
// @Consumes  application/json

// @SecurityDefinitions.apikey Bearer
// @in header
// @name Authorization
// @Scheme bearer
// @BearerFormat JWT
func main() {
	if err := godotenv.Load(); err != nil {
		log.Fatal("Error to load .env files")
	}

	e := echo.New()

	routes.Generate(e)

	config.DatabaseInit()

	e.Use(middleware.LoggerWithConfig(middleware.LoggerConfig{
		Format: `[${time_rfc3339}]  ${status}  ${method}  ${host}${path} ${latency_human}` + "\n",
	}))

	e.Use(middleware.Recover())

	e.Use(middleware.CORSWithConfig(middleware.CORSConfig{
		AllowOrigins: []string{"*"}, // Permite todas as origens
		AllowMethods: []string{echo.GET, echo.POST, echo.PUT, echo.DELETE, echo.OPTIONS},
		AllowHeaders: []string{echo.HeaderContentType, echo.HeaderAuthorization},
	}))

	log.Fatal(e.Start(":8080"))
}
