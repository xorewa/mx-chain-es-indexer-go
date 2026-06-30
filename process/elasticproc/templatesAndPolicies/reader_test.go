package templatesAndPolicies

import (
	"encoding/json"
	"os"
	"path/filepath"
	"strings"
	"testing"

	"github.com/multiversx/mx-chain-es-indexer-go/process/dataindexer"
	"github.com/stretchr/testify/require"
)

func TestTemplatesAndPolicyReaderNoKibana_GetElasticTemplatesAndPolicies(t *testing.T) {
	t.Parallel()

	reader := NewTemplatesAndPolicyReader(false, "", nil, nil)

	templates, policies, err := reader.GetElasticTemplatesAndPolicies()
	require.Nil(t, err)
	require.Len(t, policies, 0)
	require.Len(t, templates, 30)

	for _, index := range []string{
		dataindexer.DrwaDenialsIndex,
		dataindexer.DrwaIdentitiesIndex,
		dataindexer.DrwaHolderComplianceIndex,
		dataindexer.DrwaAttestationsIndex,
		dataindexer.DrwaTokenPoliciesIndex,
		dataindexer.DrwaControlEventsIndex,
		dataindexer.MrvAnchoredProofsIndex,
	} {
		require.Contains(t, templates, index)
	}
}

func TestTemplatesAndPolicyReaderFileMode_LoadsDRWAMRVTemplates(t *testing.T) {
	t.Parallel()

	drwaMRVIndices := []string{
		dataindexer.DrwaDenialsIndex,
		dataindexer.DrwaIdentitiesIndex,
		dataindexer.DrwaHolderComplianceIndex,
		dataindexer.DrwaAttestationsIndex,
		dataindexer.DrwaTokenPoliciesIndex,
		dataindexer.DrwaControlEventsIndex,
		dataindexer.MrvAnchoredProofsIndex,
	}

	configPath := filepath.Join("..", "..", "..", "cmd", "elasticindexer", "config")
	reader := NewTemplatesAndPolicyReader(true, configPath, drwaMRVIndices, nil)

	templates, policies, err := reader.GetElasticTemplatesAndPolicies()
	require.NoError(t, err)
	require.Empty(t, policies)
	require.Len(t, templates, len(drwaMRVIndices))

	for _, index := range drwaMRVIndices {
		template, ok := templates[index]
		require.True(t, ok, index)

		templateObject := make(map[string]interface{})
		require.NoError(t, json.Unmarshal(template.Bytes(), &templateObject), index)
		require.Contains(t, templateObject, "index_patterns", index)
		require.Contains(t, templateObject, "template", index)
	}

	configBytes, err := os.ReadFile(filepath.Join(configPath, "config.toml"))
	require.NoError(t, err)

	configContents := string(configBytes)
	for _, index := range drwaMRVIndices {
		require.True(t, strings.Contains(configContents, `"`+index+`"`), index)
	}
}
