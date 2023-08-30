package BookShop.Dto;

public class ProductDto {
	private int idloai;
	private int idbook;
	private int idtg;
	private String tensach;
	private double soluong;
	private double dongia;
	private String hinhanh;
	
	public ProductDto() {
		
	}
	
	public int getIdloai() {
		return idloai;
	}
	public void setIdloai(int idloai) {
		this.idloai = idloai;
	}
	public int getIdbook() {
		return idbook;
	}
	public void setIdbook(int idbook) {
		this.idbook = idbook;
	}
	public int getIdtg() {
		return idtg;
	}
	public void setIdtg(int idtg) {
		this.idtg = idtg;
	}
	public String getTensach() {
		return tensach;
	}
	public void setTensach(String tensach) {
		this.tensach = tensach;
	}
	public double getSoluong() {
		return soluong;
	}
	public void setSoluong(double soluong) {
		this.soluong = soluong;
	}
	public double getDongia() {
		return dongia;
	}
	public void setDongia(double dongia) {
		this.dongia = dongia;
	}
	public String getHinhanh() {
		return hinhanh;
	}
	public void setHinhanh(String hinhanh) {
		this.hinhanh = hinhanh;
	}
	
	
	
}
