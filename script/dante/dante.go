package main

import flag "github.com/spf13/pflag"

type danteOpts struct {
	emailaddr  string
	password   string
	SMTPServer string
	port       string
}

func initFlags() *danteOpts {
	opts := new(danteOpts)

	flag.StringVar(&opts.emailaddr, "email", "email address", "Client email address")
	flag.StringVar(&opts.password, "password", "password", "client password")
	flag.StringVar(&opts.SMTPServer, "server", "server", "client server that we are trying to connect")
	flag.StringVar(&opts.port, "port", "465", "port number of the client server that we wish to connect")
	flag.Parse()

	return opts
}

func main() {
	//The receiver needs to be in slice as the receive is our multiple servers
	Receiver := []string{
		"ubuntu@security-protocol.com",
		"ubuntu@valid.security-protocol.com",
		"ubuntu@wrong-signature.security-protocol.com",
		"ubuntu@missing-signature.security-protocol.com",
		"ubuntu@different-cert.security-protocol.com",
		"ubuntu@no-cert-starttls.security-protocol.com",
		"ubuntu@missing-ds.security-protocol.com",
		"ubuntu@dane-diff-usage.security-protocol.com",
		"ubuntu@dane-diff-selector.security-protocol.com",
	}

	Subject := "Busted environment testing mail"

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

	bodyMessage := WriteHTMLEmail(Receiver, Subject, Message)
	sendMail(Receiver, Subject, bodyMessage)
}
