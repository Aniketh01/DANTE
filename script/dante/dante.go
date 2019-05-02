package main

func main() {

	//The receiver needs to be in slice as the receive is our multiple servers
	Receiver := []string{
		"security-protocol.com",
		"valid.security-protocol.com",
		"wrong-signature.security-protocol.com",
		"missing-signature.security-protocol.com",
		"different-cert.security-protocol.com",
		"no-cert-starttls.security-protocol.com",
		"missing-ds.security-protocol.com",
		"dane-diff-usage.security-protocol.com",
		"dane-diff-selector.security-protocol.com",
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
