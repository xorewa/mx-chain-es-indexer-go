TESTS_TO_RUN := $(shell go list ./... | grep -v integrationtests | grep -v mock)
ELASTIC_PASSWORD ?= elastic
ES_PORT ?= 9200
ES_TRANSPORT_PORT ?= 9300
ES_URL ?= http://localhost:$(ES_PORT)
ELASTIC_CONTAINER_NAME ?= elastic-container
OPEN_SEARCH_CONTAINER_NAME ?= open-container
OPEN_SEARCH_PERFORMANCE_PORT ?= 9600
export ELASTIC_PASSWORD
export ES_PORT
export ES_TRANSPORT_PORT
export ES_URL
export ELASTIC_CONTAINER_NAME
export OPEN_SEARCH_CONTAINER_NAME
export OPEN_SEARCH_PERFORMANCE_PORT


test:
	@echo "  >  Running unit tests"
	go test -cover -race -coverprofile=coverage.txt -covermode=atomic -v ${TESTS_TO_RUN}

integration-tests:
	@set -e; \
	cleanup() { (cd scripts && /bin/bash script.sh delete || true); (cd scripts && /bin/bash script.sh stop || true); }; \
	trap cleanup EXIT; \
	echo " > Running integration tests"; \
	(cd scripts && /bin/bash script.sh start ${ES_VERSION}); \
	go test -v ./integrationtests -tags integrationtests

long-tests:
	@-$(MAKE) delete-cluster-data
	go test -v ./integrationtests -tags integrationtests

start-cluster-with-kibana:
	@echo " > Starting Elasticsearch node and Kibana"
	docker compose up -d

stop-cluster:
	docker compose down

delete-cluster-data:
	cd scripts && /bin/bash script.sh delete

integration-tests-open-search:
	@set -e; \
	cleanup() { (cd scripts && /bin/bash script.sh delete || true); (cd scripts && /bin/bash script.sh stop_open_search || true); }; \
	trap cleanup EXIT; \
	echo " > Running integration tests open search"; \
	(cd scripts && /bin/bash script.sh start_open_search ${OPEN_VERSION}); \
	go test -v ./integrationtests -tags integrationtests

INDEXER_IMAGE_NAME="elasticindexer"
INDEXER_IMAGE_TAG="latest"
DOCKER_FILE=Dockerfile

docker-build:
	docker build \
		 -t ${INDEXER_IMAGE_NAME}:${INDEXER_IMAGE_TAG} \
		 -f ${DOCKER_FILE} \
		 .
