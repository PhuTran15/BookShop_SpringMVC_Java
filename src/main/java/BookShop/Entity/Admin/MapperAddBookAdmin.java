package BookShop.Entity.Admin;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MapperAddBookAdmin implements RowMapper<AddBookAdmin>{

	public AddBookAdmin mapRow(ResultSet rs, int rowNum) throws SQLException {
		AddBookAdmin addbook = new AddBookAdmin();
		addbook.setIdloai(rs.getLong("idloai"));
		addbook.setTensach(rs.getString("tensach"));
		addbook.setTacgia(rs.getString("tacgia"));
		addbook.setTennxb(rs.getString("tennxb"));
		addbook.setGioithieu(rs.getString("gioithieu"));
		addbook.setDongia(rs.getLong("soluong"));
		addbook.setSoluong(rs.getLong("dongia"));
		return addbook;
	}	
}
