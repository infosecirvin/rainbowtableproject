package main

import (
    "fmt"
    "os/exec"
)

func main() {
  var hash string = "B267DF22CB945E3E"
  _,err := exec.Command("./rcracki_mt", "-h", hash, "~/rt/lanman").Output()
  if err != nil {
      fmt.Printf("%s", err)
  }
}
