package BookShop.Entity.Admin;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;


public class MapperHoaDonAdmin implements RowMapper<HoaDonAdmin>{

	public HoaDonAdmin mapRow(ResultSet rs, int rowNum) throws SQLException {
		HoaDonAdmin hoadon = new HoaDonAdmin();
		hoadon.setIdhd(rs.getLong("idhd"));
		hoadon.setIdkh(rs.getString("user"));
		hoadon.setNgaydh(rs.getString("ngaydh"));
		hoadon.setNgaygh(rs.getString("ngaygh"));
		hoadon.setNoigiao(rs.getString("noigiao"));
		hoadon.setSdt(rs.getString("sdtgiaohang"));
		hoadon.setTongtien(rs.getLong("Tiensach"));
		hoadon.setPhivc(rs.getLong("phivc"));
		hoadon.setTinhtrang(rs.getInt("tinhtrang"));
		return hoadon;
	}

}
