APP_NAME="canasta"

build: | generate
	go build -o ${APP_NAME}

generate:
	go generate ./...

test: | generate
	go test -race -cover ./...

benchmark:
	go test -benchmem -bench . ./...

fmt:
	test -z $(shell go fmt ./...)

lint:
	golint -set_exit_status ./...

all: canasta
	chmod 755 ${APP_NAME}
