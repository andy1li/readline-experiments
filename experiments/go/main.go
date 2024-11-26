package main

import (
	"io"
	"os"
	"os/exec"

	"github.com/creack/pty"
)

func main() {
	runCommand("node", "../javascript.js", "../../recordings/javascript_with_go.txt")
	runCommand("ruby", "../ruby.rb", "../../recordings/ruby_with_go.txt")
}

func runCommand(command string, args string, outputPath string) {
	c := exec.Command(command, args)
	f, err := pty.Start(c)
	if err != nil {
		panic(err)
	}

	go func() {
		f.Write([]byte("nonexistent\n"))
		f.Write([]byte{4}) // EOT
	}()

	file, err := os.Create(outputPath)
	if err != nil {
		panic(err)
	}
	defer file.Close()
	io.Copy(file, f)
}
