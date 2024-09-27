import sys

args = sys.argv[1:]
result = 0

for i in args:    # i는 타입이 str
    result = result + int(i)

print(result)