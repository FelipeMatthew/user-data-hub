package models

type Admin struct {
	Id       uint   `gorm:"primaryKey"`
	Username string `json:"username"`
	Password string `json:"password"`
}

func (Admin) TableName() string {
	return "admin"
}

type Clients struct {
	Id        uint   `gorm:"primaryKey"`
	FirstName string `json:"first_name"`
	LastName  string `json:"last_name"`
	Email     string `json:"email"`
	Age       uint   `json:"age"`
	Phone     string `json:"phone"`
}
