package config

import (
	"fmt"
	"os"

	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

var (
	database *gorm.DB
	e        error
)

func DatabaseInit() {
	host := os.Getenv("DB_HOST")
	user := os.Getenv("DB_USER")
	password := os.Getenv("DB_PASSWORD")
	dbName := os.Getenv("DB_NAME")
	port := os.Getenv("DB_PORT")

	dns := fmt.Sprintf("host=%s user=%s password=%s dbname=%s port=%s sslmode=disable", host, user, password, dbName, port)

	database, e = gorm.Open(postgres.Open(dns), &gorm.Config{})
	if e != nil {
		panic(e)
	}
}

func DB() *gorm.DB {
	return database
}
