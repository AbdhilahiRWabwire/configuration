package main

import (
	"fmt"
	"log"
	"os"
	"os/exec"
	"strings"
)

func main() {
	var dnfUpdate *exec.Cmd = exec.Command(
		"sudo",
		"dnf",
		"-y",
		"upgrade",
	)

	var dnfUpdateOutput strings.Builder

	dnfUpdate.Stdout = &dnfUpdateOutput

	var dnfUpdateError error = dnfUpdate.Run()

	if dnfUpdateError != nil {
		log.Fatalln("DNF Update Failed: \n", dnfUpdateError)
	} else {
		fmt.Println("Executed Command: \n", dnfUpdate)
		fmt.Println("Running DNF Update: \n", dnfUpdateOutput.String())

		os.Exit(0)
	}
}
