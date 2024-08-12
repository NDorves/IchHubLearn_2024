import mysql.connector
# Database configuration
dbconfig = {
    'host': 'ich-db.ccegls0svc9m.eu-central-1.rds.amazonaws.com',
    'user': 'ich1',
    'password': 'xxxxxxxx',
    'database': 'ich_edit'
}

# Establishing the connection
connection = mysql.connector.connect(**dbconfig)
cursor = connection.cursor()

