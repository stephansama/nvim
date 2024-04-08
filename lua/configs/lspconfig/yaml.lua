local schemas = {
	["https://json.schemastore.org/dependabot-2.0.json"] = "/dependabot.yml",
}

return {
	yaml = { schemas = schemas },
	redhat = { telemetry = { enabled = false } },
}
