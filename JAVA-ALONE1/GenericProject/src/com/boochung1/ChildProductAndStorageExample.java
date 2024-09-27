package com.boochung1;

public class ChildProductAndStorageExample {

	public static void main(String[] args) {
		ChildProduct<Tv, String, String> product
			= new ChildProduct<>();
		product.setKind(new Tv());
		product.setModel("SonyTv-65inch");
		product.setCompany("Sony");
		
		Storage<Tv> storage = new StorageImpl<>(100);
		storage.add(new Tv(), 0);
		Tv tv = storage.get(0);
	}

}
