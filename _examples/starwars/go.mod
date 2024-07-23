module github.com/nebucloud/grpc-graphql-gateway/_examples/starwars

go 1.22.0

replace github.com/nebucloud/grpc-graphql-gateway => ../..

require (
	github.com/graphql-go/graphql v0.8.1
	github.com/nebucloud/grpc-graphql-gateway v0.0.0-00010101000000-000000000000
	github.com/pkg/errors v0.9.1
	google.golang.org/grpc v1.65.0
	google.golang.org/protobuf v1.34.2
)

require (
	github.com/iancoleman/strcase v0.3.0 // indirect
	golang.org/x/net v0.27.0 // indirect
	golang.org/x/sys v0.22.0 // indirect
	golang.org/x/text v0.16.0 // indirect
	google.golang.org/genproto/googleapis/rpc v0.0.0-20240722135656-d784300faade // indirect
)
