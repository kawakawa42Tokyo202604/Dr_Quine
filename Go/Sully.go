package main

import (
	"fmt"
	"os"
	"os/exec"
	"path/filepath"
	"runtime"
)

func main() {
	i := 5
	s := "package main\n\nimport (\n\t\"fmt\"\n\t\"os\"\n\t\"os/exec\"\n\t\"path/filepath\"\n\t\"runtime\"\n)\n\nfunc main() {\n\ti := %[1]d\n\ts := %[2]q\n\t_, file, _, _ := runtime.Caller(0)\n\tif filepath.Base(file) != \"Sully.go\" {\n\t\ti--\n\t}\n\tif i < 0 {\n\t\treturn\n\t}\n\tname := fmt.Sprintf(\"Sully_%%d\", i)\n\tf, err := os.Create(name + \".go\")\n\tif err != nil {\n\t\tfmt.Fprintln(os.Stderr, err)\n\t\tos.Exit(1)\n\t}\n\tif _, err = fmt.Fprintf(f, s, i, s); err != nil {\n\t\tf.Close()\n\t\tfmt.Fprintln(os.Stderr, err)\n\t\tos.Exit(1)\n\t}\n\tif err = f.Close(); err != nil {\n\t\tfmt.Fprintln(os.Stderr, err)\n\t\tos.Exit(1)\n\t}\n\tif err = exec.Command(\"go\", \"build\", \"-o\", name, name+\".go\").Run(); err != nil {\n\t\tfmt.Fprintln(os.Stderr, err)\n\t\tos.Exit(1)\n\t}\n\tif err = exec.Command(\"./\" + name).Run(); err != nil {\n\t\tfmt.Fprintln(os.Stderr, err)\n\t\tos.Exit(1)\n\t}\n}\n"
	_, file, _, _ := runtime.Caller(0)
	if filepath.Base(file) != "Sully.go" {
		i--
	}
	if i < 0 {
		return
	}
	name := fmt.Sprintf("Sully_%d", i)
	f, err := os.Create(name + ".go")
	if err != nil {
		fmt.Fprintln(os.Stderr, err)
		os.Exit(1)
	}
	if _, err = fmt.Fprintf(f, s, i, s); err != nil {
		f.Close()
		fmt.Fprintln(os.Stderr, err)
		os.Exit(1)
	}
	if err = f.Close(); err != nil {
		fmt.Fprintln(os.Stderr, err)
		os.Exit(1)
	}
	if err = exec.Command("go", "build", "-o", name, name+".go").Run(); err != nil {
		fmt.Fprintln(os.Stderr, err)
		os.Exit(1)
	}
	if err = exec.Command("./" + name).Run(); err != nil {
		fmt.Fprintln(os.Stderr, err)
		os.Exit(1)
	}
}
