package BookShop.Entity.User;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MapperTheLoai implements RowMapper<TheLoai> {
	public TheLoai mapRow(ResultSet rs, int rowNum) throws SQLException {
		TheLoai tl = new TheLoai();
		tl.setIdloai(rs.getInt("idloai"));
		tl.setTenloai(rs.getString("tenloai"));

		return tl;
}
}
