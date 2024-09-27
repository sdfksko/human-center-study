package sec07;

public class Student extends People {
	public int studentNo;
	
	public Student(String name, String ssn, int studentNo) {
		super(name, ssn);    // 부모가 가지는 2개의 인수를 가진 생성자 호출
		this.studentNo = studentNo;
	}

}
