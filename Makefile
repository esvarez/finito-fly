MY_AWS_PROFILE = default

GOOS = linux
GOARCH = amd64
GO_ENABLED = 0

# Setup a local serverless stack and runs it
run:
	AWS_PROFILE=$(MY_AWS_PROFILE) sam local start-api

build-run:
	make build && make run

build:
	GOOS=linux GOARCH=amd64 CGO_ENABLED=0 sam build