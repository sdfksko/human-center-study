import school,start

while(True):
    print("1: 입력, 2: 출력, 3: 종료 ")
    print("번호 : ",end = "")
    no=int(input())

    if no == 1:
        print("번호 : ",end =" ")
        idx=int(input())

        print("이름 : ",end =" ")
        name=input()

        vo = school.Student()
        vo.setStudentNo(idx)
        vo.setStudentName(name)

        start.insert(vo)
    elif no == 2:
        result = start.select()

        for vo in result:
            print(vo)
    elif no == 3:
        print("프로그램을 종료합니다")
        break