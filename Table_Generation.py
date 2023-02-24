# input csv files to convert to .db files
files=['brands.csv','receipt_items.csv','receipts.csv','users.csv']

import sqlite3
import pandas as pd
conn = sqlite3.connect('Fetch.db')
c = conn.cursor()
for file in files:
    df=pd.read_csv(file)
    col=df.columns
    a=file.split(".")[0][:-1]
    ddl="CREATE TABLE {} (".format(a)
    for i in col:
        ddl+=i+" VARCHAR(50) ,"
    ddl=ddl[:-1]
    ddl+=");"
    
    c.execute("DROP TABLE IF EXISTS {}".format(a))
    c.execute('''{}'''.format(ddl))
    import csv
    ques="?,"*len(col)
    ques=ques[:-1]

    with open(file, 'r') as f:
        reader = csv.reader(f)
        for row in reader:
            c.execute("INSERT INTO {a} VALUES ({q})".format(a=a,q=ques),row)
    conn.commit()
conn.close()