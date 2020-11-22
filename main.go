package main
import (
	//"fmt"
	"os"
	"net/http"
)

func indexHandler(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte("<h1><center>Irvin's RainbowTable Project</center></h1>"))
	w.Write([]byte("<h2><center>Submit your hash below</center></h2>"))
}


func main() {
	var Hash string

	port := os.Getenv("PORT")
	if port == "" {
		port = "3000"
	}

	mux := http.NewServeMux()
	mux.HandleFunc("/", indexHandler)
	http.ListenAndServe(":"+port, mux)
}
