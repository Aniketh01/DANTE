package main

import (
	"fmt"

	"github.com/hpcloud/tail"
)

func getLog() {
	t, err := tail.TailFile("/var/log/mail.log", tail.Config{Follow: true})
	for line := range t.Lines {
		fmt.Println(line.Text)
	}

	if err != nil {
		fmt.Println("error")
	}
}

// func parsePostfixLog() {
// 	p := postfixlog.NewPostfixLog()
// 	logFormat, _ := p.Parse(textByte)
// 	pp.Println(logFormat)
// }
