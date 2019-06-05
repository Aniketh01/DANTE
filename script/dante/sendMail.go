package main

import (
	"bytes"
	"fmt"
	"mime/quotedprintable"
	"net/smtp"
	"strings"
)

var opt = initFlags()

//sendMail iterates through each SMTPServer and sends the email to the Reciever.
func sendMail(Subject, bodyMessage string) error {
	msg := "From: " + opt.emailaddr + "\n" +
		"To: " + strings.Join([]string{opt.Receiver}, ",") + "\n" +
		"Subject: " + Subject + "\n" + bodyMessage

	err := smtp.SendMail(opt.SMTPServer+":"+opt.port,
		smtp.PlainAuth("", opt.emailaddr, opt.password, opt.SMTPServer),
		opt.emailaddr, []string{opt.Receiver}, []byte(msg))

	if err != nil {
		fmt.Printf("An smtp error: %s %s: %s\n", err, opt.SMTPServer, opt.port)
		return err
	}

	fmt.Printf("Mail sent successfully from %s:\n", opt.SMTPServer)
	return err
}

//WriteEmail writes the entire Email to be send
func WriteEmail(contentType, subject, bodyMessage string) string {
	header := make(map[string]string)
	header["From"] = opt.emailaddr

	receipient := ""

	receipient = receipient + opt.Receiver

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
func WriteHTMLEmail(subject, bodyMessage string) string {

	return WriteEmail("text/html", subject, bodyMessage)
}

//WritePlainEmail writes the email in text/plain format
func WritePlainEmail(subject, bodyMessage string) string {

	return WriteEmail("text/plain", subject, bodyMessage)
}
