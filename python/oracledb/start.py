import dbconn

def select():
    conn = dbconn.connect()
    if not conn:
        print("db와 연결이 안됌")
        return False
    
    try:
        with conn.cursor() as co:
            sql = "select * from school"
            co.execute(sql)
            result = co.fetchall()
            return result
    except Exception as e:
        print(e)

print(select())

def insert(vo):
    conn = dbconn.connect()
    if not conn:
        print("db 오류")
        return
    
    try:
        with conn.cursor() as con:
            tsql = f"insert into school values({vo.getStudentNo()}, '{vo.getStudentName()}')"
            con.execute(tsql)
            conn.commit()

    except Exception as e:
        print(e)

