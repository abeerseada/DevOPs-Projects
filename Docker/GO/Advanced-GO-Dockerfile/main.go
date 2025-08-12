package main

import (
	"go_app/routes"
	"go_app/routes/api"
	"log"
	"net/http"
	"os"
	"path/filepath"
	"strconv"
)

func main() {
	tempDir, err := os.MkdirTemp("", "app-")
	if err != nil {
		log.Fatalf("Could not create temp directory: %v", err)
	}

	pidFilePath := filepath.Join(tempDir, "app.pid")
	pid := strconv.Itoa(os.Getpid())
	if err := os.WriteFile(pidFilePath, []byte(pid), 0644); err != nil {
		log.Fatalf("Could not write PID file: %v", err)
	}

	log.Printf("Created temp dir: %s and wrote PID: %s", tempDir, pid)

	mux := http.NewServeMux()

	mux.HandleFunc("/", routes.Index)

	mux.HandleFunc("/api/handler_4adcdba85589b00d1ebf", api.Handler4adcdba85589b00d1ebf)
	mux.HandleFunc("/api/handler_7f655ef4ac6a73b04164", api.Handler7f655ef4ac6a73b04164)
	mux.HandleFunc("/api/handler_801dbc82833cfc65e5ce", api.Handler801dbc82833cfc65e5ce)
	mux.HandleFunc("/api/handler_36072fef892a9924fd7c", api.Handler36072fef892a9924fd7c)
	mux.HandleFunc("/api/handler_765344eeb8bad78e37cb", api.Handler765344eeb8bad78e37cb)

	fs := http.FileServer(http.Dir("static"))
	mux.Handle("/static/", http.StripPrefix("/static/", fs))

	port := os.Getenv("PORT")
	if port == "" {
		port = "3000"
	}

	log.Printf("Server listening on port %s...", port)
	if err := http.ListenAndServe(":"+port, mux); err != nil {
		log.Fatal(err)
	}
}
