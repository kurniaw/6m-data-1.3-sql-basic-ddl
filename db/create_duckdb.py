import duckdb
import pandas as pd

con = duckdb.connect("unit-1-3.db")

r1 = con.sql("select * from lesson.teachers")
r2 = con.sql("select * from lesson.classes")
r3 = con.sql("select * from lesson.students")

#r1.to_df().join(r2.to_df(), on="class_id").show()
r1.show()
r1.df().to_json()
r2.show()
r3.show()




# Panda DataFrame to DuckDB
pandas_df = pd.DataFrame(
    {
        "A": ["a", "b", "c", "d", "e"],
        "B": ["f", "g", "h", "i", "j"],
        "C": ["k", "l", "m", "n", "o"],
    },
    index=[1, 2, 3, 4, 5],
)
#con.sql("SELECT * FROM pandas_df").show()

# import CSV file to DuckDB
#con.read_csv('teachers.csv').insert_into('lesson.teachers')
#con.read_csv("classes.csv").insert_into("lesson.classes")
#con.read_csv('students.csv').insert_into('lesson.students')

#pd.read_csv("classes.csv")
#duckdb.sql("SELECT * FROM classes").show()