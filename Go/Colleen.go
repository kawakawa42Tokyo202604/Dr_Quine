package main

import "fmt"

// hello
func printSrc() {
	s := "package main\n\nimport \"fmt\"\n\n// hello\nfunc printSrc() {\n\ts := %q\n\tfmt.Printf(s, s)\n}\n\nfunc main() {\n\t//hello\n\tprintSrc()\n}\n"
	fmt.Printf(s, s)
}

func main() {
	//hello
	printSrc()
}
