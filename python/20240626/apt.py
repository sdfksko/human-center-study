# 23년 8월 부동산 실거래가 데이터(apt2308.csv) 전처리 및 분석
# 강원도에 120m2이상 3억원 이하인 아파트만 검색한 결과를 임의의 csv파일로 저장
import os, re
import usecsv
#실거래가 정보파일이 있는 폴더로 이동
os.chdir(r'D:\python\20240626')
total = usecsv.opencsv('apt2308.csv')

apt = usecsv.switch(total)
print(apt[:2])
print(len(apt))

for i in apt[:10]:
    print(i[8])

for i in apt:
    try:
        if i[5] >= 120 and i[8] <= 30000 and re.match('강원', i[0]):
            print(i[0], i[5], i[8])
    except:
        pass

empty = []

for i in apt:
    try:
        if i[5] >= 120 and i[8] <= 30000 and re.match('강원', i[0]):
            empty.append([i[0], i[4], i[5], i[8]])
    except:
        pass

usecsv.writecsv('GangWondoAPT.csv', empty)