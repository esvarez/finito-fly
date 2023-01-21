MY_AWS_PROFILE = default
SERVERLESS_BUCKET = es-test-serverless-bucket
STACK_NAME = test-serverless-stack

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

package:
	AWS_PROFILE=$(MY_AWS_PROFILE) sam package \
		--s3-bucket $(SERVERLESS_BUCKET) \
		--output-template-file ./.aws-sam/packaged.yaml

deploy:
	AWS_PROFILE=$(MY_AWS_PROFILE) make build && make package && \
		sam deploy --no-confirm-changeset \
		--no-fail-on-empty-changeset \
		--s3-bucket $(SERVERLESS_BUCKET) \
		--stack-name $(STACK_NAME) \
		--capabilities CAPABILITY_IAM

