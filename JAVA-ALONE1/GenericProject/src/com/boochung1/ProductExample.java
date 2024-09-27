package com.boochung1;

public class ProductExample {

	public static void main(String[] args) {
		Product<Tv, String> product1 = new Product<>();
		
		product1.setKind(new Tv());
		product1.setModel("SM-A401-65-APLUS");
		
		Tv tv1 = product1.getKind();
		String model1 = product1.getModel();
		
		Product<Car, String> product2 = new Product<>();
		
		product2.setKind(new Car());
		product2.setModel("GENESIS-HYUNDAI-4.0");
		
		Car car1 = product2.getKind();
		String model2 = product2.getModel();
		
	

	}

}
