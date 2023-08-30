package BookShop.Entity.Admin;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MapperTheLoaiAdmin implements RowMapper<TheLoaiAdmin>{

	public TheLoaiAdmin mapRow(ResultSet rs, int rowNum) throws SQLException {
		TheLoaiAdmin theloai = new TheLoaiAdmin();
		theloai.setIdloai(rs.getInt("idloai"));
		theloai.setTheloai(rs.getString("tenloai"));
		return theloai;
	}
}
