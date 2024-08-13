package handlers

import (
    "net/http"

    "github.com/felipematthew/go-learnings/client-api/api/auth"
    "github.com/felipematthew/go-learnings/client-api/api/config"
    "github.com/felipematthew/go-learnings/client-api/api/models"
    "github.com/labstack/echo/v4"
)

// GetAdmin godoc
// @Summary Get all admins
// @Description get admins
// @Tags admin
// @Accept  json
// @Produce  json
// @Success 200 {object} []models.Admin
// @Failure 500 {object} map[string]interface{}
// @Router /admin [get]
func GetAdmin(c echo.Context) error {
    db := config.DB()

    admins := []*models.Admin{}

    if err := db.Find(&admins).Error; err != nil {
        data := map[string]interface{}{
            "message": err.Error(),
        }
        return c.JSON(http.StatusInternalServerError, data)
    }

    response := map[string]interface{}{
        "data": admins,
    }

    return c.JSON(http.StatusOK, response)
}

// CreateAdmin godoc
// @Summary Create an admin
// @Description create admin
// @Tags admin
// @Accept  json
// @Produce  json
// @Param admin body models.Admin true "Admin data"
// @Success 200 {object} models.Admin
// @Failure 400 {object} map[string]string
// @Router /admin [post]
func CreateAdmin(c echo.Context) error {
    db := config.DB()
    admin := new(models.Admin)

    if err := c.Bind(admin); err != nil {
        return c.JSON(http.StatusBadRequest, map[string]string{
            "message": "invalid request",
        })
    }

    // Hash user pass
    hashedPassword, err := auth.HashPassword(admin.Password)
    if err != nil {
        return c.JSON(http.StatusBadRequest, map[string]string{
            "message": "Failed to hash password",
        })
    }

    admin.Password = hashedPassword

    if err := db.Create(&admin).Error; err != nil {
        return c.JSON(http.StatusBadRequest, map[string]string{
            "message": "Failed to create admin",
        })
    }

    return c.JSON(http.StatusOK, admin)
}

// DeleteAdmin godoc
// @Summary Delete an admin
// @Description delete admin by ID
// @Tags admin
// @Accept  json
// @Produce  json
// @Param id path int true "Admin ID"
// @Success 200 {object} map[string]string
// @Failure 500 {object} map[string]interface{}
// @Router /admin/{id} [delete]
func DeleteAdmin(c echo.Context) error {
    id := c.Param("id")
    db := config.DB()

    admin := new(models.Admin)

    if err := db.Find(&admin, id).Error; err != nil {
        data := map[string]interface{}{
            "message": err.Error(),
        }
        return c.JSON(http.StatusInternalServerError, data)
    }

    if admin.Id == 0 {
        return c.JSON(http.StatusInternalServerError, "id not founded")
    }

    if err := db.Delete(&admin, id).Error; err != nil {
        data := map[string]interface{}{
            "message": err.Error(),
        }
        return c.JSON(http.StatusInternalServerError, data)
    }

    response := map[string]string{
        "data": "admin deleted successfully",
    }

    return c.JSON(http.StatusOK, response)
}
