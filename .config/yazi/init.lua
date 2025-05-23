require("git"):setup()

-- DuckDB plugin configuration
require("duckdb"):setup({
	mode = "standard",
	row_id = false,
})
