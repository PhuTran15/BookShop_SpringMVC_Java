package BookShop.Entity.User;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MapperBooks implements RowMapper<Books>{

	public Books mapRow(ResultSet rs, int rowNum) throws SQLException {
		Books books = new Books();
		books.setIdbook(rs.getInt("idbook"));
//		books.setIdtg(rs.getInt("idtg"));
		books.setIdkm(rs.getInt("idkm"));
//		books.setIdnxb(rs.getInt("idnxb"));
		books.setIdloai(rs.getInt("idloai"));
		books.setTensach(rs.getString("tensach"));
		books.setTacgia(rs.getString("tacgia"));
		books.setTennxb(rs.getString("tennxb"));
		books.setGioithieu(rs.getString("gioithieu"));
		books.setSoluong(rs.getInt("soluong"));
		books.setDongia(rs.getInt("dongia"));
		books.setHinhanh(rs.getString("hinhanh"));
		books.setTenloai(rs.getString("tenloai"));
		return books;
	}

}
