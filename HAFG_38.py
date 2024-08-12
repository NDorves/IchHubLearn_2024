# 1. В базе данных ich_edit три таблицы. Users с полями (id, name, age), Products с полями (pid, prod, quantity)
# и Sales с полями (sid, id, pid). Написать мини-интерфейс к базе данных, который умеет выполнять разные команды.
# 1.Выбрать таблицу для запроса. Предусмотреть возможность выбрать несколько таблиц. Вывести результат их соединения,
# если это возможно, или сообщение об ошибке.
# 2.Выбрать одно поле из выбранной таблицы и искомое значение этого поля. Вывести все подходящие строки
# Доработать мини-интерфейс к базе данных, который был сделан на занятии. Новые возможности интерфейса:
#
# Ввести список полей выбранной таблицы.
#
# При вводе искомого значения добавить возможность выбора знака - найти записи, в которых выбранное поле больше,
# меньше или равно введенному значению.



from main38 import connection, cursor
import mysql.connector
#
# # Database configuration
# dbconfig = {
#     'host': 'ich-db.ccegls0svc9m.eu-central-1.rds.amazonaws.com',
#     'user': 'ich1',
#     'password': 'xxxxxx',
#     'database': 'ich_edit'
# }
#
# # Establishing the connection
# connection = mysql.connector.connect(**dbconfig)
# cursor = connection.cursor()
#

def select_table():
    tables = input("Введите названия таблиц через запятую (например, users, products): ").split(", ")
    return tables


def join_tables(tables):
    if len(tables) > 1:
        try:
            query = "SELECT * FROM " + tables[0]
            for table in tables[1:]:
                query += " JOIN " + table + " ON " + tables[0] + ".id = " + table + ".pid"
            cursor.execute(query)
            result = cursor.fetchall()
            for row in result:
                print(row)
        except mysql.connector.Error as err:
            print("Ошибка: {}".format(err))
    else:
        cursor.execute("SELECT * FROM " + tables[0])
        result = cursor.fetchall()
        for row in result:
            print(row)


def select_field_and_value(table):
    field = input("Введите поле из таблицы {}: ".format(table))
    value = input("Введите значение для поля {}: ".format(field))
    operator = input("Введите оператор сравнения (=, <, >): ")
    query = "SELECT * FROM {} WHERE {} {} %s".format(table, field, operator)
    cursor.execute(query, (value,))
    result = cursor.fetchall()
    for row in result:
        print(row)


def main():
    tables = select_table()
    join_tables(tables)
    table = input("Введите таблицу для поиска: ")
    select_field_and_value(table)


if __name__ == "__main__":
    main()

# Closing the cursor and connection
cursor.close()
connection.close()
