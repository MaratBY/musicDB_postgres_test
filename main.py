import psycopg2
from sql_scripts.ddl_script import create_tables


def create():
    try:
        conn = psycopg2.connect(database="<your_db_name>", user='<your_username>',
                                password='<pswrd>', host='127.0.0.1', port='5432')
        conn.autocommit = True
        queries = create_tables
        if conn.info.status == 0:
            print("Connected to", conn.info.dbname)
            cursor = conn.cursor()
            cursor.execute(queries)
            print("Tables created successfully!")
            conn.close()
        else:
            print("Error while connection establishing. Check the credentials.")
            return None
    except ConnectionError:
        print("Execution failed due bad connection settings.")


if __name__ == "__main__":
    create()
