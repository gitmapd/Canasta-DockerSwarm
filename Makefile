APP_NAME="canasta"

build: 
	@go build -o ${APP_NAME} ./.
	@go mod tidy
	@go mod verify
	@echo "To run the CLI you have just generated, please call it as \033[0;32m./${APP_NAME}\033[0m instead of ${APP_NAME}."

test: 
	go test -race -cover ./...

benchmark:
	go test -benchmem -bench . ./...

fmt:
	test -z $(shell go fmt ./...)

prepare-lint:
	@if ! hash golangci-lint 2>/dev/null; then printf "\e[1;36m>> Installing golangci-lint (this may take a while)...\e[0m\n"; go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest; fi

lint:
	@printf "\e[1;36m>> golangci-lint\e[0m\n"
	@golangci-lint run ./...

all: canasta
	chmod +x ${APP_NAME}


help: 
	@printf "\n"
	@printf "\e[1mUsage:\e[0m\n"
	@printf "  make \e[36m<target>\e[0m\n"
	@printf "\n"
	@printf "\e[1mGeneral\e[0m\n"
	@printf "  \e[36mhelp\e[0m                     Display this help.\n"
	@printf "\n"
	@printf "\e[1mBuild\e[0m\n"
	@printf "  \e[36mbuild\e[0m                    Build binary.\n"
	@printf "\n"
	@printf "\e[1mTest\e[0m\n"
	@printf "  \e[36mcheck\e[0m                    Run the test suite (unit tests and golangci-lint).\n"
	@printf "  \e[36mprepare-lint\e[0m  	   Install golangci-lint. This is used in CI, you should probably install golangci-lint using your package manager.\n"
	@printf "  \e[36mlint\e[0m                     Run lint.\n"
	@printf "\n"
