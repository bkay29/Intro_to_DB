import mysql.connector
from mysql.connector import Error

def create_database():
    try:
        # Establish connection
        connection = mysql.connector.connect(
            host="localhost",
            user="root",
            password="Bkay@MySQL#21",
            use_pure=True   
        )
        
        if connection.is_connected():
            cursor = connection.cursor()
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
            print("Database 'alx_book_store' created successfully!")

    except mysql.connector.Error as e:
        print(f"Error while connecting to MySQL: {e}")
    
    finally:
        try:
            if connection.is_connected():
                cursor.close()
                connection.close()
        except NameError:
            # connection not defined if connect() failed
            pass

if __name__ == "__main__":
    create_database()
