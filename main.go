package main

import (
	"fmt"
	"net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Printf("Request received from %s\n", r.RemoteAddr)
	fmt.Fprintf(w, "Hello, Distroless!")
}

func main() {
	http.HandleFunc("/", handler)
	fmt.Println("Server is running on port 8080")
	http.ListenAndServe(":8080", nil)
}
