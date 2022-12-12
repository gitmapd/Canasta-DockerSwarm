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

prepare-static-check:
	@if ! hash golangci-lint 2>/dev/null; then printf "\e[1;36m>> Installing golangci-lint (this may take a while)...\e[0m\n"; go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest; fi

lint:
	@printf "\e[1;36m>> golangci-lint\e[0m\n"
	@golangci-lint run ./...

all: canasta
	chmod 755 ${APP_NAME}
