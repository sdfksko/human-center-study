import re

a = '나는 컴퓨터다'
m = re.search(r'컴\D+', a)

print(type(m))
print(bool(m))

if bool(m) == True:
    print(m.group())

if m:
    print(m.group())