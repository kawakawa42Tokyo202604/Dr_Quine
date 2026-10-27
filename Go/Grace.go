package main

import (
	"fmt"
	"os"
)

// Grace
func main() {
	s := "package main\n\nimport (\n\t\"fmt\"\n\t\"os\"\n)\n\n// Grace\nfunc main() {\n\ts := %q\n\tf, err := os.Create(\"Grace_kid.go\")\n\tif err != nil {\n\t\treturn\n\t}\n\tdefer f.Close()\n\tfmt.Fprintf(f, s, s)\n}\n"
	f, err := os.Create("Grace_kid.go")
	if err != nil {
		return
	}
	defer f.Close()
	fmt.Fprintf(f, s, s)
}
