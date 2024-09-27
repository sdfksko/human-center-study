package practice;

import java.util.*;

public class Practice01 {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		
		// king 1 queen 2 look 2 bishop 2 knight 2 phone 8
		System.out.println();
		int king = Integer.parseInt(scanner.nextLine());
		int queen = Integer.parseInt(scanner.nextLine());
		int look = Integer.parseInt(scanner.nextLine());
		int bishop = Integer.parseInt(scanner.nextLine());
		int knight = Integer.parseInt(scanner.nextLine());
		int phone = Integer.parseInt(scanner.nextLine());
		
		List list = new ArrayList();
		list.add(king);
		list.add(queen);
		list.add(look);
		list.add(bishop);
		list.add(knight);
		list.add(phone);
		System.out.println(list);
	}
}