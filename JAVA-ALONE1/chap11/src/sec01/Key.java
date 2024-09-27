package sec01;

public class Key {
	public int number;
	
	public Key(int number) {
		// super(); // 생략되어 있음(Object의 기본생성자)
		this.number = number;
	}
	@Override
	public boolean equals(Object obj) {
		if(obj instanceof Key) { // ClassCastException 방지
			
			Key key = (Key)obj; // 강제형변환(casting)
		
			if (this.number == key.number)
				return true;
		}
		return false;
		
		
	}
	
	@Override
	public int hashCode() { // 주소값이 hashcode값이 아니라 number가 해시코드가 되도록 재정의
		return number;
	}

}
