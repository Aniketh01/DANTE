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
func sendMail(Recv []string, Subject, bodyMessage string) {
	msg := "From: " + opt.emailaddr + "\n" +
		"To: " + strings.Join(Recv, ",") + "\n" +
		"Subject: " + Subject + "\n" + bodyMessage

	err := smtp.SendMail(opt.SMTPServer+":"+opt.port,
		smtp.PlainAuth("", opt.emailaddr, opt.password, opt.SMTPServer),
		opt.emailaddr, Recv, []byte(msg))

	if err != nil {
		fmt.Printf("smtp error: %s%s%s", err, opt.SMTPServer, opt.port)
		return
	}

	fmt.Printf("Mail sent successfully from %s:\n", opt.SMTPServer)
}

//WriteEmail writes the entire Email to be send
func WriteEmail(dest []string, contentType, subject, bodyMessage string) string {
	header := make(map[string]string)
	header["From"] = opt.emailaddr

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
func WriteHTMLEmail(dest []string, subject, bodyMessage string) string {

	return WriteEmail(dest, "text/html", subject, bodyMessage)
}

//WritePlainEmail writes the email in text/plain format
func WritePlainEmail(dest []string, subject, bodyMessage string) string {

	return WriteEmail(dest, "text/plain", subject, bodyMessage)
}
