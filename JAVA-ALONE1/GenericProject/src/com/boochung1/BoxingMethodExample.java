package com.boochung1;

public class BoxingMethodExample {

	public static void main(String[] args) {
		// Util.<Integer>boxing의 <Integer>는 생략이 가능하다
		BoxGeneric<Integer> box1 = Util.<Integer>boxing(100);
		box1.get();
		
		BoxGeneric<String> box2 = Util.boxing("100");
		box2.get();
		
		// Util.compare("1", "2"); // error -> 숫자만 가능
		
		Util.compare(1, 2);		// int -> Integer 자동으로 boxing
		Util.compare(2, 1);		// int -> Integer 자동으로 boxing
		Util.compare(2.1, 1);	// double -> Double 자동으로 boxing
		
		

	}

}
