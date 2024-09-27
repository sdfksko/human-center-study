# opencsv, writecsv함수를 생성하여 이용
import csv

# csv파일을 이중리스트 객체값을 반환하는 함수
def opencsv(filename):
    f = open(filename, 'r', encoding='utf-8') # 읽기 모드로 a.csv파일을 open
    reader = csv.reader(f)    # csv.reader로 csv파일 내용을 읽어 new변수에 담기
    output = []
    for i in reader:
        output.append(i)
    return output

# 이중리스트 객체를 csv파일 생성하는 함수
def writecsv(filename, the_list):
    with open(filename, 'w', newline= '', encoding='utf-8') as f:
        csv_object = csv.writer(f, delimiter=',')
        csv_object.writerows(the_list)

# 문자로 된 숫자를 숫자형으로 바꾸는 함수(파라미터는 이중화 리스트일 경우에만 적용)
def switch(list_name):
    for j in list_name:
        for i in j:
            try:
                j[j.index(i)] = float(i.replace(',', ''))
            except:
                pass

    return list_name