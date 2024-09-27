package sec03;

public class Product {
	private int pno;		// 상품 고유번호(상품의 주민등록번호 같은 거)
	private String name;	// 상품명
	private int price;		// 가격
	private int stock;		// 재고
	
	
	
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	
	
}	
