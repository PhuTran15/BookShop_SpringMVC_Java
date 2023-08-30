package BookShop.Entity.User;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MapperLienhe implements RowMapper<Lienhe> {

	public Lienhe mapRow(ResultSet rs, int rowNum) throws SQLException {
		Lienhe lienhe = new Lienhe();
		lienhe.setEmail(rs.getString("email"));
		lienhe.setTieude(rs.getString("tieude"));
		lienhe.setNoidung(rs.getString("noidung"));
		return lienhe;
	}

}
