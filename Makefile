.PHONY: command clean

GRAPHQL_CMD=protoc-gen-graphql
VERSION=$(or ${tag}, dev)
UNAME:=$(shell uname)

ifeq ($(UNAME), Darwin)
	PROTOPATH := $(shell brew --prefix protobuf)/include
endif
ifeq ($(UNAME), Linux)
	PROTOPATH := /usr/local/include
endif

command: plugin clean
	cd ${GRAPHQL_CMD} && \
		go build \
			-ldflags "-X main.version=${VERSION}" \
			-o ../dist/${GRAPHQL_CMD}

plugin:
	mkdir -p generated
	protoc -I ${PROTOPATH} \
		-I include/graphql \
		--go-grpc_out=./generated \
		include/graphql/graphql.proto
	mkdir -p graphql
	find ./generated -name "*.pb.go" -exec mv {} graphql/ \;
	rm -rf ./generated

lint:
	golangci-lint run

test:
	go list ./... | xargs go test

build: test plugin

clean:
	rm -rf ./dist/*

all: clean build
	cd ${GRAPHQL_CMD} && GOOS=darwin GOARCH=amd64 go build -ldflags "-X main.version=${VERSION}" -o ../dist/${GRAPHQL_CMD}.darwin
	cd ${GRAPHQL_CMD} && GOOS=darwin GOARCH=arm64 go build -ldflags "-X main.version=${VERSION}" -o ../dist/${GRAPHQL_CMD}.darwin.arm64
	cd ${GRAPHQL_CMD} && GOOS=linux GOARCH=amd64 go build -ldflags "-X main.version=${VERSION}" -o ../dist/${GRAPHQL_CMD}.linux
