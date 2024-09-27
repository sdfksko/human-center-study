class Student:
    def __init__(self):
      self.student_no=0
      self.student_name = None

    def setStudentNo(self,no):
      self.student_no=no
    def getStudentNo(self):
      return self.student_no
    
    def setStudentName(self,name):
      self.student_name=name
    def getStudentName(self):
      return self.student_name 