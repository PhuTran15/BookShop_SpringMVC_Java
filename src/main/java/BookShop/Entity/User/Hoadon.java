package BookShop.Entity.User;

public class Hoadon {
	private int idhd;
	private int tinhtrang;
	private String giamgia;
	private String diachi;
	private String phone;
	private double totalPrice;
	private double totalPriceCart;
	private int quanty;
	private String user;
	
	public Hoadon() {
		super();
	}
	



	public String getGiamgia() {
		return giamgia;
	}



	public void setGiamgia(String giamgia) {
		this.giamgia = giamgia;
	}



	public String getUser() {
		return user;
	}
	
	public double getTotalPriceCart() {
		return totalPriceCart;
	}

	public void setTotalPriceCart(double totalPriceCart) {
		this.totalPriceCart = totalPriceCart;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public void setIdhd(int idhd) {
		this.idhd = idhd;
	}
	
	public int getIdhd() {
		return idhd;
	}


	public int getTinhtrang() {
		return tinhtrang;
	}

	public void setTinhtrang(int tinhtrang) {
		this.tinhtrang = tinhtrang;
	}
	
	public String getDiachi() {
		return diachi;
	}
	public void setDiachi(String diachi) {
		this.diachi = diachi;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getQuanty() {
		return quanty;
	}
	public void setQuanty(int quanty) {
		this.quanty = quanty;
	}
	
	
}
