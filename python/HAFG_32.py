# 1. Реализовать класс Counter, который представляет счетчик. Класс должен поддерживать следующие операции:
# - Увеличение значения счетчика на заданное число (оператор +=)
# - Уменьшение значения счетчика на заданное число (оператор -=)
# - Преобразование счетчика в строку (метод __str__)
# - Получение текущего значения счетчика (метод __int__)
# Пример использования:
# counter = Counter(5)
# counter += 3
# print(counter)  # Вывод: 8
# counter -= 2
# print(int(counter))  # Вывод: 6

class Counter:
    def __init__(self, value=0):
        self.value = value


    def __add__(self, other):

        return Counter(self.value + other)

    def __sub__(self, other):
        return Counter(self.value - other)


    def __str__(self):
        result = f'{self.value}'
        return result

counter = Counter(5)
counter += 3
print('Вывод:', counter)
counter -= 2
print('Вывод:',counter)

#
#
# 2. Реализовать класс Email, представляющий электронное письмо. Класс должен поддерживать следующие операции:
# - Сравнение писем по дате (операторы <, >, <=, >=, ==, !=)
# - Преобразование письма в строку (метод __str__)
# - Получение длины текста письма (метод __len__)
# - Получение хеш-значения письма (метод __hash__)
# - Проверка наличия текста в письме (метод __bool__)
# Пример использования:
# email1 = Email("john@example.com", "jane@example.com", "Meeting", "Hi Jane, let's have a meeting tomorrow.", "2022-05-10")
# email2 = Email("jane@example.com", "john@example.com", "Re: Meeting", "Sure, let's meet at 2 PM.", "2022-05-10")
# email3 = Email("alice@example.com", "bob@example.com", "Hello", "Hi Bob, how are you?", "2022-05-09")
# print(email1)  # Вывод:
# """
# rom: john@example.com
# To: jane@example.com
# Subject: Meeting
# Hi Jane, let's have a meeting tomorrow.
# """
# print(len(email2))  # Вывод: 24
# print(hash(email3))  # Вывод: -920444056
# print(bool(email1))  # Вывод: True
# print(email2 > email3)  # Вывод: True
class Email:


    def __init__(self, from_email, to_email, subject, text, date):
        self.from_email = from_email
        self.to_email = to_email
        self.subject = subject
        self.text = text
        self.date = date

    def __str__(self):

        return f'From  {self.from_email}\n send to {self.to_email}\n subject{self.subject}\n {self.text}'

    def __len__(self):
        return len(self.text)


    def __hash__(self):
        return hash(self.text)


    def __bool__(self):
        return bool(self.text)

    def __eq__(self, other):
        return self.date == other.date

    def __ne__(self, other):
        return  self.date == other.date

    def __lt__(self, other):
        return  self.date < other.date

    def __le__(self, other):
        return self.date <= other.date

    def __gt__(self, other):
        return self.date > other.date

    def __ge__(self, other):
        return self.date >= other.date


email1 = Email("john@example.com", "jane@example.com", "Meeting","Hi Jane, let's have a meeting tomorrow.", "2022-05-10")
print(email1)
email2 = Email("jane@example.com", "john@example.com", "Re: Meeting", "Sure, let's meet at 2 PM.", "2022-05-10")
print(email2)
email3 = Email("alice@example.com", "bob@example.com", "Hello", "Hi Bob, how are you?", "2022-05-09")
print(email3)
print(len(email2))  # Вывод: 24
print(hash(email3))  # Вывод: -920444056
print(bool(email1))  # Вывод: True
print(email2 > email3)  # Вывод: True
