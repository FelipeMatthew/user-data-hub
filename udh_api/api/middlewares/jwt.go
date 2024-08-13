package middlewares

import (
	"os"

	"github.com/felipematthew/go-learnings/client-api/api/models"
	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
)

var config = middleware.JWTConfig{
	Claims:        &models.JwtCustomClaims{},
	SigningMethod: "HS512",
	SigningKey:    []byte(os.Getenv("SECRET_KEY")),
}

func JwtWithConfig(next echo.HandlerFunc) echo.HandlerFunc {
	return func(c echo.Context) error {
		return middleware.JWTWithConfig(config)(next)(c)
	}
}
