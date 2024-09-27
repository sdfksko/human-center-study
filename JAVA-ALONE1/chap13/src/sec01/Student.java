package sec01;

import sec01.Member;

public class Student {
	public int studentNum;
	public String name;
	
	public Student (int studentNum, String name) {
		this.studentNum = studentNum;
		this.name = name;
	}
	
	// 학번이 같으면 동일한 Student라고 가정
	@Override
	public int hashCode() {
		return this.studentNum;
	}
	
	@Override
	public boolean equals(Object obj) {
		if (obj instanceof Student) { // ClassCastException 방지
			Student student = (Student)obj; // 강제형변환(casting)
	
			return student.studentNum == this.studentNum;
		}
		
		return false;
	}
}
