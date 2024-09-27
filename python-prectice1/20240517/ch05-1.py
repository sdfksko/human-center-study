# 클래스 학습

# 기존의 배운 내용으로 만든 add함수

# calculator1.py
result = 0

def add(num):
    global result
    result += num   # 결괏값(result)에 입력값(num)
    return result   # 결괏값 리턴

print(add(3)) # 0 + 3 -> 3
print(add(4)) # 3 + 4 -> 7

# calculator2.py
result1 = 0
result2 = 0

def add1(num):  # 계산기1
    global result1
    result1 += num
    return result1

def add2(num):  # 계산기2
    global result2
    result2 += num
    return result2

print(add1(3))  # 3   0 + 3 -> 3
print(add1(4))  # 7   3 + 4 -> 7  
print(add2(3))  # 10  0 + 3 -> 3
print(add2(7))  # 17  3 + 7 -> 10

# calculator3.py
# Calculator클래스 생성
class Calculator:
    def __init__(self):         # 생성자(변수를 초기화)와 비슷한 역할
        self.result = 0         # result변수를 0으로 초기화

    def add(self, num):         # add 일반함수
        self.result = self.result + num
        return self.result
    
cal1 = Calculator()        # 객체 생성(실제 붕어빵)하여 cal1변수에 대입
cal2 = Calculator()        # 객체 생성(실제 붕어빵)하여 Cal2변수에 대입

a = cal1.add(3) # class Calculator안에 있는 add함수를 호출
print(a)
