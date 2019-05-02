package main

import "fmt"

func main() {

	//The receiver needs to be in slice as the receive is our multiple servers

	user, pass := getAuth()
	fmt.Println(user, pass)

}
