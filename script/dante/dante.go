package main

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

	user, pass := getAuth()
	sender := newSender(user, pass)

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

	bodyMessage := sender.WriteHTMLEmail(Receiver, Subject, Message)
	sender.sendMail(Receiver, Subject, bodyMessage)
}
