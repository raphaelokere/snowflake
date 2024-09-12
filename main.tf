terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.63.0"
    }
  }
}

provider "snowflake" {
  username       = "RAPHAELOKERE"
  account        = "YQB16430"
  role           = "ACCOUNTADMIN"
  password    = var.password
}

# Create a Snowflake database
resource "snowflake_database" "demo_db" {
  name    = "DEMO_DB"
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
