package com.boochung1;

public class BoxExample {

	public static void main(String[] args) {
		Box box = new Box();
		
		// 단점 : 캐스팅하는 과정 중에 너무 성능을 깍아버림
		box.setObject("hello");; // String타입을 Object타입 자동타입변환(promotion);
		String str1 = (String)box.getObject(); // Object타입을 String타입으로 강제타입변환
		
		Box box4 = new Box();
		box.setObject(1);
		Integer int2 = (Integer)box.getObject();
		//--------------------------------------------------------------------------
		
		// 위의 단점을 개선하는 것이 Generic
		BoxGeneric<String> box2 = new BoxGeneric<>();
		box2.set("hello");
		String str2 = box2.get();	// 더 이상 강제타입변환인 캐스팅을 할 필요가 없음
		
		BoxGeneric<Integer> box3 = new BoxGeneric<>();
		box3.set(1);
		Integer int1 = box3.get();
		
		BoxGeneric<Box> box5 = new BoxGeneric<>();
		box5.set(new Box());
		Box box10 = box5.get();
		
		System.out.println("프로그램 종료");
	}
	
}
