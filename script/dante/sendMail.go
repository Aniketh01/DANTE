package main

import (
	"encoding/json"
	"fmt"
	"log"
	"os"
)

// SMTPServer is a list of top <x> Email providers to test.
var SMTPServer = map[string]int{
	"smtp.mail.com":     587,
	"smtp.gmail.com":    587,
	"smtp.fastmail.com": 465,
	"mail.ru":           465,
	"applesmtp.163.com": 465,
	"smtp.126.com":      465,
}

// Sender contains the auth credentials
type Sender struct {
	UserEmail string
	Password  string
}

func newSender(username, password string) Sender {
	return Sender{username, password}
}

// getAuth takes the user email and password from the config.json
func getAuth() (username, password string) {
	file, err := os.Open("config.json")

	if err != nil {
		log.Fatal(err)
	}

	var sender Sender
	decoder := json.NewDecoder(file)
	if err := decoder.Decode(&sender); err != nil {
		log.Fatal(err)
	}

	return sender.UserEmail, sender.Password
}

func sendMail() {

	fmt.Println(SMTPServer)
}
