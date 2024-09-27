package sec02;

import java.util.*;

public class StackExample {

	public static void main(String[] args) {
		Stack<Coin> coinBox = new Stack<Coin>();	// LIFO
		
		coinBox.push(new Coin(100));
		coinBox.push(new Coin(50));
		coinBox.push(new Coin(500));
		coinBox.push(new Coin(10));
		
		while(!coinBox.isEmpty()) {
			Coin coin = coinBox.pop(); // 제일 마지막에 들어온 Coin부터 제거
			System.out.println("꺼내온 동전 : " + coin.getValue() + "원");
		}
	}

}
