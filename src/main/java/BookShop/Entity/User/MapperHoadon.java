package BookShop.Entity.User;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MapperHoadon implements RowMapper<Hoadon> {
	public Hoadon mapRow(ResultSet rs, int rowNum) throws SQLException {
		Hoadon chitiet = new Hoadon();
		chitiet.setIdhd(rs.getInt("idhd"));
		chitiet.setUser(rs.getString("user"));
//		chitiet.setNgaydh(rs.getDate("ngaydh"));
//		chitiet.setNgaygh(rs.getDate("ngaygh"));
		chitiet.setPhone(rs.getString("phone"));
		chitiet.setTotalPrice(rs.getInt("Tiensach"));
		chitiet.setTinhtrang(rs.getInt("tinhtrang"));
		chitiet.setGiamgia(rs.getString("giamgia"));
		return chitiet;
}
}
