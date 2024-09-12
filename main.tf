provider "snowflake" {
  username = "RAPHAELOKERE"
  #  account     = "YQB16430.us-east-1"
  account     = "YQB16430"
  role        = "ACCOUNTADMIN"
  private_key = var.snowflake_private_key

}

# Create a Snowflake database
resource "snowflake_database" "demo_db" {
  name = "DEMO_DB"
  comment = "Database created by Terraform"
}

# Create a Snowflake schema
resource "snowflake_schema" "demo_schema" {
  database = snowflake_database.demo_db.name
  name     = "DEMO_SCHEMA"
}

# Create a Snowflake table
resource "snowflake_table" "demo_table" {
  database = snowflake_database.demo_db.name
  schema   = snowflake_schema.demo_schema.name
  name     = "DEMO_TABLE"
  column {
    name = "ID"
    type = "NUMBER"
  }
  column {
    name = "NAME"
    type = "VARCHAR(255)"
  }
}
