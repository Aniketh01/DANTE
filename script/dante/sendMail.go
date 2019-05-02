package main

import (
	"bytes"
	"encoding/json"
	"fmt"
	"log"
	"mime/quotedprintable"
	"net/smtp"
	"os"
	"strings"
)

// SMTPServer is a list of top <x> Email providers to test.
var SMTPServer = map[string]string{
	"smtp.mail.com":     ":587",
	"smtp.gmail.com":    ":587",
	"smtp.fastmail.com": ":465",
	"mail.ru":           ":465",
	"applesmtp.163.com": ":465",
	"smtp.126.com":      ":465",
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

//sendMail iterates through each SMTPServer and sends the email to the Reciever.
func sendMail(Recv []string, Subject, bodyMessage string) {
	var sender Sender
	msg := "From: " + sender.UserEmail + "\n" +
		"To: " + strings.Join(Recv, ",") + "\n" +
		"Subject: " + Subject + "\n" + bodyMessage

	for k, v := range SMTPServer {
		err := smtp.SendMail(k+v,
			smtp.PlainAuth("", sender.UserEmail, sender.Password, k),
			sender.UserEmail, Recv, []byte(msg))

		if err != nil {
			fmt.Printf("smtp error: %s", err)
			return
		}

		fmt.Println("Mail sent successfully!")
	}
}

//WriteEmail writes the entire Email to be send
func (sender Sender) WriteEmail(dest []string, contentType, subject, bodyMessage string) string {

	header := make(map[string]string)
	header["From"] = sender.UserEmail

	receipient := ""

	for _, user := range dest {
		receipient = receipient + user
	}

	header["To"] = receipient
	header["Subject"] = subject
	header["MIME-Version"] = "1.0"
	header["Content-Type"] = fmt.Sprintf("%s; charset=\"utf-8\"", contentType)
	header["Content-Transfer-Encoding"] = "quoted-printable"
	header["Content-Disposition"] = "inline"

	message := ""

	for key, value := range header {
		message += fmt.Sprintf("%s: %s\r\n", key, value)
	}

	var encodedMessage bytes.Buffer

	finalMessage := quotedprintable.NewWriter(&encodedMessage)
	finalMessage.Write([]byte(bodyMessage))
	finalMessage.Close()

	message += "\r\n" + encodedMessage.String()

	return message
}

//WriteHTMLEmail writes the email in text/html format
func (sender *Sender) WriteHTMLEmail(dest []string, subject, bodyMessage string) string {

	return sender.WriteEmail(dest, "text/html", subject, bodyMessage)
}

//WritePlainEmail writes the email in text/plain format
func (sender *Sender) WritePlainEmail(dest []string, subject, bodyMessage string) string {

	return sender.WriteEmail(dest, "text/plain", subject, bodyMessage)
}
