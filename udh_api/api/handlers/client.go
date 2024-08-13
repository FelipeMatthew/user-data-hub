package handlers

import (
	"net/http"

	"github.com/felipematthew/go-learnings/client-api/api/config"
	"github.com/felipematthew/go-learnings/client-api/api/models"
	"github.com/labstack/echo/v4"
)

// GetAllClients godoc
// @Summary Get all clients
// @Description Get all clients
// @Tags clients
// @Accept  json
// @Produce  json
// @Success 200 {array} models.Clients
// @Failure 500 {object} map[string]interface{}
// @Router /clients [get]
func GetAllClients(c echo.Context) error {
	db := config.DB()
	clients := []*models.Clients{}

	if err := db.Find(&clients).Error; err != nil {
		data := map[string]interface{}{
			"message": err.Error(),
		}
		return c.JSON(http.StatusInternalServerError, data)
	}

	response := map[string]interface{}{
		"status": 200,
		"data":   clients,
	}

	return c.JSON(http.StatusOK, response)
}

// GetByIdClient godoc
// @Summary Get a client by ID
// @Description Get a client by ID
// @Tags clients
// @Accept  json
// @Produce  json
// @Param id path int true "Client ID"
// @Success 200 {object} models.Clients
// @Failure 500 {object} map[string]interface{}
// @Router /clients/{id} [get]
func GetByIdClient(c echo.Context) error {
	db := config.DB()
	id := c.Param("id")
	client := new(models.Clients)

	if err := db.Where("id = ?", id).Find(&client).Error; err != nil {
		data := map[string]interface{}{
			"message": err.Error(),
		}
		return c.JSON(http.StatusInternalServerError, data)
	}

	if client.Id == 0 {
		data := map[string]string{
			"message": "user not founded",
		}
		return c.JSON(http.StatusInternalServerError, data)
	}

	response := map[string]interface{}{
		"status": 200,
		"data":   client,
	}

	return c.JSON(http.StatusOK, response)
}

// CreateClient godoc
// @Summary Create a new client
// @Description Create a new client
// @Tags clients
// @Accept  json
// @Produce  json
// @Param client body models.Clients true "Client data"
// @Success 201 {object} models.Clients
// @Failure 500 {object} map[string]interface{}
// @Router /clients [post]
func CreateClient(c echo.Context) error {
	db := config.DB()
	client := &models.Clients{}

	// Body
	if err := c.Bind(&client); err != nil {
		data := map[string]interface{}{
			"message": err.Error(),
		}
		return c.JSON(http.StatusInternalServerError, data)
	}

	newClient := &models.Clients{
		FirstName: client.FirstName,
		LastName:  client.LastName,
		Email:     client.Email,
		Age:       client.Age,
		Phone:     client.Phone,
	}

	if err := db.Create(&newClient).Error; err != nil {
		data := map[string]interface{}{
			"message": err.Error(),
		}
		return c.JSON(http.StatusInternalServerError, data)
	}

	response := map[string]interface{}{
		"status": "201",
		"data":   newClient,
	}

	return c.JSON(http.StatusCreated, response)
}

// DeleteClient godoc
// @Summary Delete a client by ID
// @Description Delete a client by ID
// @Tags clients
// @Accept  json
// @Produce  json
// @Param id path int true "Client ID"
// @Success 200 {object} map[string]interface{}
// @Failure 500 {object} map[string]interface{}
// @Router /clients/{id} [delete]
func DeleteClient(c echo.Context) error {
	db := config.DB()
	id := c.Param("id")
	client := new(models.Clients)

	if err := db.Delete(&client, id).Error; err != nil {
		data := map[string]interface{}{
			"message": err.Error(),
		}
		return c.JSON(http.StatusInternalServerError, data)
	}

	response := map[string]interface{}{
		"message": "user deleted successfully",
	}

	return c.JSON(http.StatusOK, response)
}

// CompleteUpdateClient godoc
// @Summary Update a client completely
// @Description Update a client completely
// @Tags clients
// @Accept  json
// @Produce  json
// @Param id path int true "Client ID"
// @Param client body models.Clients true "Client data"
// @Success 200 {object} map[string]interface{}
// @Failure 500 {object} map[string]interface{}
// @Router /clients/{id} [put]
func CompleteUpdateClient(c echo.Context) error {
	id := c.Param("id")
	db := config.DB()
	client := new(models.Clients)

	// Body req
	if err := c.Bind(&client); err != nil {
		data := map[string]interface{}{
			"message": err.Error(),
		}
		return c.JSON(http.StatusInternalServerError, data)
	}

	// Get in db by id
	newClient := new(models.Clients)
	if err := db.Find(&newClient, id).Error; err != nil {
		data := map[string]interface{}{
			"message": err.Error(),
		}
		return c.JSON(http.StatusInternalServerError, data)
	}

	// Updates then
	newClient.FirstName = client.FirstName
	newClient.LastName = client.LastName
	newClient.Email = client.Email
	newClient.Age = client.Age
	newClient.Phone = client.Phone

	// Save in db
	if err := db.Model(&models.Clients{}).Where("id = ?", id).Updates(newClient).Error; err != nil {
		data := map[string]interface{}{
			"message": err.Error(),
		}
		return c.JSON(http.StatusInternalServerError, data)
	}

	response := map[string]interface{}{
		"message": "user edited successfully",
		"data":    newClient,
	}

	return c.JSON(http.StatusOK, response)
}

// PartialUpdateClient godoc
// @Summary Update a client partially
// @Description Update a client partially
// @Tags clients
// @Accept  json
// @Produce  json
// @Param id path int true "Client ID"
// @Param client body models.Clients true "Client data"
// @Success 200 {object} map[string]interface{}
// @Failure 500 {object} map[string]interface{}
// @Router /clients/{id} [patch]
func PartialUpdateClient(c echo.Context) error {
	id := c.Param("id")
	db := config.DB()
	client := new(models.Clients)

	// Get body
	if err := c.Bind(&client); err != nil {
		data := map[string]interface{}{
			"message": err.Error(),
		}
		return c.JSON(http.StatusInternalServerError, data)
	}

	newClient := new(models.Clients)
	// Find user
	if err := db.Find(&newClient, id).Error; err != nil {
		data := map[string]interface{}{
			"message": err.Error(),
		}
		return c.JSON(http.StatusInternalServerError, data)
	}

	// Validations
	if newClient.FirstName != "" {
		newClient.FirstName = client.FirstName
	}
	if client.LastName != "" {
		newClient.LastName = client.LastName
	}
	if newClient.Email != "" {
		newClient.Email = client.Email
	}
	if newClient.Age != 0 {
		newClient.Age = client.Age
	}
	if newClient.Phone != "" {
		newClient.Phone = client.Phone
	}

	if err := db.Model(&models.Clients{}).Where("id = ?", id).Updates(newClient).Error; err != nil {
		data := map[string]interface{}{
			"message": err.Error(),
		}
		return c.JSON(http.StatusInternalServerError, data)
	}

	response := map[string]interface{}{
		"data": newClient,
	}

	return c.JSON(http.StatusOK, response)
}