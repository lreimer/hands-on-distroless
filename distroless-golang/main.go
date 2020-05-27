package main

import (
	"fmt"
	"net/http"
	"os"
)

func init() {
	fmt.Println("Hands-on Distroless with Golang")
}

func main() {
	http.HandleFunc("/", indexHandler)

	http.ListenAndServe(port(), nil)
}

func port() string {
	port := os.Getenv("PORT")
	if len(port) == 0 {
		port = "8080"
	}
	return ":" + port
}

func indexHandler(w http.ResponseWriter, r *http.Request) {
	if r.URL.Path != "/" {
		http.NotFound(w, r)
		return
	}

	w.WriteHeader(http.StatusOK)
	fmt.Fprintf(w, "Hands-on Distroless with Golang")
}
