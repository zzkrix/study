package main

import (
	"time"
)

func TTT(){
	tk := time.newTicker(1 * time.Second)
	defer tk.Stop()
	
	for {
		select{
		case <-tk.C:
			fmt.Println("11111111111111")
	}
}

func main() {
	TTT()
}