package main

import (
	"fmt"

	flag "github.com/spf13/pflag"
)

type danteOpts struct {
	emailaddr  string
	password   string
	SMTPServer string
	port       string
	Receiver   string
}

func initFlags() *danteOpts {
	opts := new(danteOpts)

	flag.StringVar(&opts.emailaddr, "email", "email address", "Client email address")
	flag.StringVar(&opts.password, "password", "password", "client password")
	flag.StringVar(&opts.SMTPServer, "server", "server", "client server that we are trying to connect")
	flag.StringVar(&opts.port, "port", "465", "port number of the client server that we wish to connect")
	flag.StringVar(&opts.Receiver, "receiver", "email address", "the receiving servers that are setup")
	flag.Parse()

	return opts
}

func main() {
	//The receiver needs to be in slice as the receive is our multiple servers

	Subject := "Busted environment testing mail for " + opt.Receiver

	Message := `
	<!DOCTYPE HTML PULBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	<html>
	<head>
	<meta http-equiv="content-type" content="text/html"; charset=ISO-8859-1">
	</head>
	<body>This is the body<br>
	<div class="moz-signature"><i><br>
	<br>
	Regards<br>
	Aniketh<br>
	<i></div>
	</body>
	</html> `

	bodyMessage := WriteHTMLEmail(Subject, Message)
	err := sendMail(Subject, bodyMessage)

	if err == nil {
		fmt.Println("writting the log...!")
		writeLog()
		initLogParse(filewritten)
	}
}
