# popSeoul2023.csv파일에서 외국인 비율이 3%가 넘는 구 정보만 csv파일 저장
import os, re
import usecsv

os.chdir(r'd:\python\20240626')

# 1. popSeoul2023.csv을 열어서 파이썬으로 데이터 가져오기
total = usecsv.opencsv("popSeoul2023.csv")

# 2. 콤마 등으 제거하여 문자로된 것을 숫자로 변환하여 다시 리스트 데이터 가져오기
newPop = usecsv.switch(total)
print(newPop[:4])

# 3. 등록 외국인의 비율 계산하기
i = newPop[1] # i -> ['종로구', 152212.0, 141060.0, 11152.0, 28265.0]
print(i)
# 종로구 -> i[0]
# 152212.0 -> i[1]
# 141060.0 -> i[2]
# 141060.0 -> i[3]
# 28265.0 -> i[4]
foreign_ratio = (i[3] / (i[2] + i[3])) * 100
print(foreign_ratio)
#소수점 첫째자리까지만 저장(둘째자리부터 반올림)
foreign_ratio = round(foreign_ratio, 1)
print(foreign_ratio)

# 4. 각 구의 외국인 비율 출력하기
for i in newPop:
    foreign_ratio = 0
    try:
        foreign_ratio = (i[3] / (i[2] + i[3])) * 100
        foreign_ratio = round(foreign_ratio, 1)
        print(i[0], foreign_ratio)
    except:
        pass

# 5. csv파일로 저장
# 5.1 첫 행 지정하기
new = [['구','한국인','외국인','외국인 비율(%)']]
# 5.2 두번째 행부터는 외국인 비율3%를 초과할 때만 csv로 저장
for i in newPop:
    foreign_ratio = 0
    try:
        foreign_ratio = (i[3] / (i[2] + i[3])) * 100
        foreign_ratio = round(foreign_ratio, 1)

        if foreign_ratio > 3:
            new.append([i[0], i[1], i[2], foreign_ratio])
    except:
        pass

# 5.3 3%넘는 구만 파일로 저장실행
usecsv.writecsv('newPop.csv', new)