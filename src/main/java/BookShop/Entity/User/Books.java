package BookShop.Entity.User;

public class Books {
	private int idbook;
//	private int idtg;
	private int idkm;
//	private int idnxb;
	private int idloai;
	private String tensach;
	private String tacgia;
	private String tennxb;
	private String gioithieu;
	private int soluong;
	private int dongia;
	private String hinhanh;
	private String tenloai;
	
	public Books() {
		super();
	}
	
	public String getTenloai() {
		return tenloai;
	}

	public void setTenloai(String tenloai) {
		this.tenloai = tenloai;
	}
	
	
	
	
//	@Id
//    @GeneratedValue(strategy = GenerationType.AUTO)
//    public Long getId() {
//        return id;
//    }
	
	public String getTennxb() {
		return tennxb;
	}

	public void setTennxb(String tennxb) {
		this.tennxb = tennxb;
	}

	public String getTacgia() {
		return tacgia;
	}

	public void setTacgia(String tacgia) {
		this.tacgia = tacgia;
	}

	public int getIdbook() {
		return idbook;
	}
	public void setIdbook(int idbook) {
		this.idbook = idbook;
	}
//	public int getIdtg() {
//		return idtg;
//	}
//	public void setIdtg(int idtg) {
//		this.idtg = idtg;
//	}
	public int getIdkm() {
		return idkm;
	}
	public void setIdkm(int idkm) {
		this.idkm = idkm;
	}
//	public int getIdnxb() {
//		return idnxb;
//	}
//	public void setIdnxb(int idnxb) {
//		this.idnxb = idnxb;
//	}
	public int getIdloai() {
		return idloai;
	}
	public void setIdloai(int idloai) {
		this.idloai = idloai;
	}
	public String getTensach() {
		return tensach;
	}
	public void setTensach(String tensach) {
		this.tensach = tensach;
	}
	public String getGioithieu() {
		return gioithieu;
	}
	public void setGioithieu(String gioithieu) {
		this.gioithieu = gioithieu;
	}
	public int getSoluong() {
		return soluong;
	}
	public void setSoluong(int soluong) {
		this.soluong = soluong;
	}
	public int getDongia() {
		return dongia;
	}
	public void setDongia(int dongia) {
		this.dongia = dongia;
	}
	public String getHinhanh() {
		return hinhanh;
	}
	public void setHinhanh(String hinhanh) {
		this.hinhanh = hinhanh;
	}
	
	

	
}
