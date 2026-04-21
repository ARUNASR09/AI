# Download the access log file

wget "https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0250EN-SkillsNetwork/labs/Bash%20Scripting/ETL%20using%20shell%20scripting/web-server-access-log.txt.gz"
# Unzip the file to extract the .txt file.
gunzip -f web-server-access-log.txt.gz

# Extract phase

echo "Extracting data"

# Extract the columns 1 (timestamp), 2 (latitude), 3 (longitude) and 
# 4 (visitorid)

cut -d"#" -f1-4 web-server-access-log.txt > extract_data.txt

# Transform phase
echo "Transforming data"

# read the extracted data and replace the colons with commas and
# write it to a csv file
tr "#" "," < extract_data.txt > transform_data.csv

# Load phase
echo "Loading data"
# Set the PostgreSQL password environment variable.
# Replace <yourpassword> with your actual PostgreSQL password.
export PGPASSWORD=O9y5hZe50SDk8bgfnn8H8ZeD;
# Send the instructions to connect to 'template1' and
# copy the file to the table 'users' through command pipeline.
echo "\c template1;\COPY access_log  FROM '/home/project/transform_data.csv' DELIMITERS ',' CSV HEADER;" | psql --username=postgres --host=postgres

echo "SELECT * FROM access_log" | psql --username=postgres --host=postgres template1;