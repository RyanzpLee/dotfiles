return {
	settings = {
		yaml = {
			schemas = {
				--[[ ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.22.0/deployment-apps-v1.json"] = "/*", ]]
				--[[ ["https://raw.githubusercontent.com/quantumblacklabs/kedro/develop/static/jsonschema/kedro-catalog-0.17.json"] = "/*", ]]
				["https://raw.githubusercontent.com/docker/cli/master/cli/compose/schema/data/config_schema_v3.9.json"] = "**/docker-compose*.y*ml",
			},
		},
	},
}
