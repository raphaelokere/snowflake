import snowflake.connector
import os

# Connect to Snowflake
conn = snowflake.connector.connect(
    user=os.getenv('SNOWFLAKE_USER'),
    password=os.getenv('SNOWFLAKE_PASSWORD'),
    account=os.getenv('SNOWFLAKE_ACCOUNT')
)

# Create a cursor object
cur = conn.cursor()

# Execute the query
cur.execute(open('data.sql').read())

# Fetch the result
results = cur.fetchall()

# Print the results
for row in results:
    print(row)

# Close the cursor and connection
cur.close()
conn.close()
