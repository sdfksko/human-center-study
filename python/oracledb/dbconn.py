import oracledb
def connect():
    try:
        connection = oracledb.connect(dsn="localhost/orcl",user="bakery_shop",password="1234")
        return connection
    except Exception as e:
        print(e)

