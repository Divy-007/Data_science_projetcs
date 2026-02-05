import sqlite3

conn = sqlite3.connect("questions.db")
cur = conn.cursor()

cur.execute("SELECT * FROM questions LIMIT 5;")
rows = cur.fetchall()

for r in rows:
    print(r)

conn.close()
