package main

import (
		"bytes"
		"encoding/json"
		"strings"
    "fmt"
    "log"
    "net/http"
    "os"
)

const zoneUrl string = "http://metadata.google.internal/computeMetadata/v1/instance/zone"

func getZone() string {
	client := &http.Client{}
	req, err := http.NewRequest("GET", zoneUrl, nil)
	req.Header.Add("Metadata-Flavor", "Google")
	response, err := client.Do(req)
	if err != nil {
		panic("Unable to retrieve zone information: " + err.Error())
	} else {
		defer response.Body.Close()
		buf := new(bytes.Buffer)
		buf.ReadFrom(response.Body)
		zoneSplit := strings.Split(buf.String(), "/")
		return zoneSplit[len(zoneSplit)-1]
	}
}

func sayHostname(w http.ResponseWriter, r *http.Request) {
  defer func() {
    if r := recover(); r != nil {
      fmt.Println("Recovered in f", r)
    }
  }()
  hostname, _ := os.Hostname()
  dat := map[string]interface{}{
    "hostname": hostname,
    "zone": getZone(),
  }
  mapB, _ := json.Marshal(dat)
  w.Header().Set("Content-Type","application/json")
  fmt.Fprintf(w, string(mapB)) // send data to client side
}

func main() {
	http.HandleFunc("/", sayHostname) // set router
	err := http.ListenAndServe(":9090", nil) // set listen port
	if err != nil {
		log.Fatal("ListenAndServe: ", err)
	}
}
