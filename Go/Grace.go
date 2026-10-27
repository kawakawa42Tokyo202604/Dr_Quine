package main

import (
	"fmt"
	"os"
)

// Grace
func main() {
	s := "package main\n\nimport (\n\t\"fmt\"\n\t\"os\"\n)\n\n// Grace\nfunc main() {\n\ts := %q\n\tf, err := os.Create(\"Grace_kid.go\")\n\tif err != nil {\n\t\tfmt.Fprintln(os.Stderr, err)\n\t\tos.Exit(1)\n\t}\n\tif _, err = fmt.Fprintf(f, s, s); err != nil {\n\t\tf.Close()\n\t\tfmt.Fprintln(os.Stderr, err)\n\t\tos.Exit(1)\n\t}\n\tif err = f.Close(); err != nil {\n\t\tfmt.Fprintln(os.Stderr, err)\n\t\tos.Exit(1)\n\t}\n}\n"
	f, err := os.Create("Grace_kid.go")
	if err != nil {
		fmt.Fprintln(os.Stderr, err)
		os.Exit(1)
	}
	if _, err = fmt.Fprintf(f, s, s); err != nil {
		f.Close()
		fmt.Fprintln(os.Stderr, err)
		os.Exit(1)
	}
	if err = f.Close(); err != nil {
		fmt.Fprintln(os.Stderr, err)
		os.Exit(1)
	}
}
