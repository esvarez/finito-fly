package main

import (
	"fmt"
	"github.com/aws/aws-lambda-go/lambda"
)

func HandleLambdaEvent() (string, error) {
	fmt.Println("Hello World")
	return "Hello", nil
}

func main() {
	lambda.Start(HandleLambdaEvent)
}
