package integrationtests

import "os"

const (
	//nolint
	testNumOfShards = 3
	//nolint
	defaultESURL = "http://localhost:9200"
	//nolint
	addressPrefix = "erd"
	//nolint
	drwaTestEmitter = "erd1v3e8wct9d45hgar9wf3k7mn5wfskxarpv3j8yetnwvcnyve5x5mqzhnlxp"
)

//nolint:unused // used by the integrationtests build-tag test files
var esURL = func() string {
	if configuredURL := os.Getenv("ES_URL"); configuredURL != "" {
		return configuredURL
	}

	return defaultESURL
}()
