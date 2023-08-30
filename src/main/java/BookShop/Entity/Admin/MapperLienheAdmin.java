package BookShop.Entity.Admin;


import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MapperLienheAdmin implements RowMapper<LienheAdmin>{

	public LienheAdmin mapRow(ResultSet rs, int rowNum) throws SQLException {
		LienheAdmin lienhe = new LienheAdmin();
		lienhe.setIdbook(rs.getInt("idbook"));
		lienhe.setEmail(rs.getString("email"));
		lienhe.setTieude(rs.getString("tieude"));
		lienhe.setNoidung(rs.getString("noidung"));

		return lienhe;
	}
}

