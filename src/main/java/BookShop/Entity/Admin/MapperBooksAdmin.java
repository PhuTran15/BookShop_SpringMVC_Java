package BookShop.Entity.Admin;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MapperBooksAdmin implements RowMapper<BooksAdmin>{

	public BooksAdmin mapRow(ResultSet rs, int rowNum) throws SQLException {
		BooksAdmin books = new BooksAdmin();
		books.setIdbook(rs.getInt("idbook"));
		books.setIdkm(rs.getInt("idkm"));
		books.setIdloai(rs.getInt("idloai"));
		books.setTensach(rs.getString("tensach"));
		books.setTennxb(rs.getString("tennxb"));
		books.setTacgia(rs.getString("tacgia"));
		books.setGioithieu(rs.getString("gioithieu"));
		books.setSoluong(rs.getInt("soluong"));
		books.setDongia(rs.getInt("dongia"));
		books.setHinhanh(rs.getString("hinhanh"));
		return books;
	}

}
