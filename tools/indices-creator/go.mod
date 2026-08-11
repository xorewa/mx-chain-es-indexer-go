module github.com/multiversx/mx-chain-es-indexer-go/tools/indexes-creator

go 1.26.2

require (
	github.com/elastic/go-elasticsearch/v7 v7.12.0
	github.com/multiversx/mx-chain-es-indexer-go v1.3.7-0.20230110115720-a54a2d8aa20d
	github.com/multiversx/mx-chain-logger-go v1.1.0
	github.com/pelletier/go-toml v1.9.3
	github.com/stretchr/testify v1.11.1
	github.com/urfave/cli v1.22.16
)

require (
	github.com/cpuguy83/go-md2man/v2 v2.0.5 // indirect
	github.com/davecgh/go-spew v1.1.1 // indirect
	github.com/denisbrodbeck/machineid v1.0.1 // indirect
	github.com/gogo/protobuf v1.3.2 // indirect
	github.com/golang/protobuf v1.5.3 // indirect
	github.com/mr-tron/base58 v1.3.0 // indirect
	github.com/multiversx/mx-chain-core-go v1.5.0 // indirect
	github.com/munnerz/goautoneg v0.0.0-20191010083416-a7dc8b61c822 // indirect
	github.com/pmezard/go-difflib v1.0.0 // indirect
	github.com/prometheus/client_model v0.6.2 // indirect
	github.com/prometheus/common v0.67.5 // indirect
	github.com/russross/blackfriday/v2 v2.1.0 // indirect
	github.com/tidwall/gjson v1.18.0 // indirect
	github.com/tidwall/match v1.1.1 // indirect
	github.com/tidwall/pretty v1.2.0 // indirect
	go.yaml.in/yaml/v2 v2.4.4 // indirect
	golang.org/x/sys v0.46.0 // indirect
	google.golang.org/protobuf v1.36.11 // indirect
	gopkg.in/yaml.v3 v3.0.1 // indirect
)

replace github.com/multiversx/mx-chain-es-indexer-go => ../..

replace github.com/multiversx/mx-chain-core-go => github.com/xorewa/mx-chain-core-go v0.0.0-20260804130641-8340309cd696

replace github.com/multiversx/mx-chain-logger-go => github.com/xorewa/mx-chain-logger-go v0.0.0-20260804131017-9f0e946f3e2c

replace github.com/multiversx/mx-chain-communication-go => github.com/xorewa/mx-chain-communication-go v0.0.0-20260804131217-755477acfd43

replace github.com/multiversx/mx-chain-vm-common-go => github.com/xorewa/mx-chain-vm-common-go v0.0.0-20260804131214-5e33a90c192a
