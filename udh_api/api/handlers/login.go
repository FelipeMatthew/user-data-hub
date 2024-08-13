package handlers

import (
	"net/http"

	"github.com/felipematthew/go-learnings/client-api/api/auth"
	"github.com/felipematthew/go-learnings/client-api/api/config"
	"github.com/felipematthew/go-learnings/client-api/api/models"
	"github.com/labstack/echo/v4"
)

// Login godoc
// @Summary Login an admin
// @Description Login an admin and return a JWT token
// @Tags login
// @Accept  json
// @Produce  json
// @Success 200 {object} map[string]interface{}
// @Failure 400 {object} map[string]string
// @Failure 500 {object} map[string]string
// @Router /login [post]
func Login(c echo.Context) error {
	db := config.DB()

	adminBind := new(models.Admin)

	if err := c.Bind(&adminBind); err != nil {
		return c.JSON(http.StatusBadRequest, map[string]string{
			"message": "Invalid request",
		})
	}

	admin := new(models.Admin)

	if err := db.Where("username = ?", adminBind.Username).First(admin).Error; err != nil {
		return c.JSON(http.StatusBadRequest, map[string]string{
			"message": "Invalid username",
		})
	}

	checkPass := auth.CheckPassword(adminBind.Password, admin.Password)
	if !checkPass {
		return c.JSON(http.StatusBadRequest, map[string]string{
			"message": "Invalid password",
		})
	}

	// Generate token
	token, err := auth.GenerateJwt(admin.Username, true)
	if err != nil {
		return c.JSON(http.StatusInternalServerError, map[string]string{
			"message": "Failed to generate token",
		})
	}

	return c.JSON(http.StatusOK, map[string]interface{}{
		"token": token,
	})
}
