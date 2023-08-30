package BookShop.Entity.User;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MapperDanhgia implements RowMapper<Danhgia>  {

	public Danhgia mapRow(ResultSet rs, int rowNum) throws SQLException {
		Danhgia d = new Danhgia();
		d.setIdbook(rs.getInt("idbook"));
		d.setNoidung(rs.getString("noidung"));
		d.setIddanhgia(rs.getInt("iddanhgia"));
		
		return d;

	}

}