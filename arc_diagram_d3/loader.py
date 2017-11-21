import csv
import sqlite3

conn = sqlite3.connect('terror_attack.db')

terror_set = set()

with open('cleaned_added_terror_country.csv', newline='', encoding='Latin1') as csvfile:
    reader = csv.reader(csvfile, delimiter=',', quotechar='|')

    counter = 0
    for row in reader:
        counter += 1
        if counter == 1:
            continue

        group_name = row[12]

        # if group_name in terror_set:
            # continue

        # terror_set.add(group_name)

        # print(row[17]) # g_country
        # print(row[18]) # g_region

        # conn.execute('INSERT INTO terror_group VALUES ("' + group_name + '","' + row[17] + '","' + row[18] + '")')

        # target_country 5, target_region 6 , year, month, day, success, group_name
        query_str = 'INSERT INTO terror_attack VALUES (' + str(counter) + ',"' + row[5] + '","' + row[6] + '",' +  str(row[2]) + ',' + str(row[3]) + ',' + str(row[4]) + ',' + str(row[10]) + ',"' + group_name + '")'

        print(query_str)
        conn.execute(query_str)
        


conn.commit()
conn.close()
