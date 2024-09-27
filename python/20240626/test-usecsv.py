import usecsv
import os

print(os.getcwd())
os.chdir(r'd:\python\20240626')

a = [['국어', '영어', '수학'], [99, 88, 77]]
usecsv.writecsv('test.csv', a)


