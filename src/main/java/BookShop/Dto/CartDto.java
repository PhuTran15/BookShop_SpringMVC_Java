package BookShop.Dto;

import BookShop.Entity.User.Books;

public class CartDto {
	private int soluong;
	private double totalPrice;
	private Books product;

	public CartDto() {
		super();
	}

	public CartDto(int soluong, double totalPrice, Books books) {
		super();
		this.soluong = soluong;
		this.totalPrice = totalPrice;
		this.product = product;
	}

	public int getSoluong() {
		return soluong;
	}

	public void setSoluong(int soluong) {
		this.soluong = soluong;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

	public Books getProduct() {
		return product;
	}

	public void setProduct(Books product) {
		this.product = product;
	}

}
