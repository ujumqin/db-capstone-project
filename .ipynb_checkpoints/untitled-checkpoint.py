!pip install mysql-connector-python

import mysql.connector as connector

connection = connector.connect(user = "admin", password = "pass123")