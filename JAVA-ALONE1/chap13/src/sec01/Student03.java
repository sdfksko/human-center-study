package sec01;

public class Student03 {
	public int sno;			// 학생번호
	public String name;		// 학생이름
	
	public Student03(int sno, String name) {
		super();
		this.sno = sno;
		this.name = name;
	}
	
	@Override
	public int hashCode() {
		return sno + name.hashCode();
	}
	
	@Override
	public boolean equals(Object obj) {
		if(obj instanceof Student03) {
			Student03 student = (Student03)obj; // 강제형변환(casting)
			
			return student.name.equals(this.name) && student.sno == this.sno; 
			
		}
	
		return false;
	}
}
