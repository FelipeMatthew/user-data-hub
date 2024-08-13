package handlers

import (
	"net/http"
	"os"

	"github.com/felipematthew/go-learnings/client-api/api/config"
	"github.com/labstack/echo/v4"
)

// Ping godoc
// @Summary Ping server
// @Description Get server and database config
// @Tags ping
// @Produce  json
// @Success 200 {object} map[string]interface{}
// @Failure 500 {object} map[string]interface{}
// @Router /ping [get]
func Ping(c echo.Context) error {
	db := config.DB()
	var db_connection = false

	if db != nil {
		db_connection = true
	}

	dbHost := os.Getenv("DB_HOST")
	dbUser := os.Getenv("DB_USER")
	dbName := os.Getenv("DB_NAME")
	dbPort := os.Getenv("DB_PORT")
	build := os.Getenv("CTN_BUILD")
	version := os.Getenv("CTN_VERSION")

	return c.JSON(http.StatusOK, map[string]interface{}{
		"db_config": map[string]interface{}{
			"connection": db_connection,
			"host":       dbHost,
			"user":       dbUser,
			"name":       dbName,
			"port":       dbPort,
		},
		"build":   build,
		"version": version,
	})

}
