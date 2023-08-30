package BookShop.Entity.Admin;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MapperUpBookAdmin implements RowMapper<UpBookAdmin>{

	public UpBookAdmin mapRow(ResultSet rs, int rowNum) throws SQLException {
		UpBookAdmin upbook = new UpBookAdmin();
		upbook.setIdbook(rs.getLong("idbook"));
		upbook.setIdloai(rs.getLong("idloai"));
		upbook.setTensach(rs.getString("tensach"));
		upbook.setTacgia(rs.getString("tacgia"));
		upbook.setTennxb(rs.getString("tennxb"));
		upbook.setGioithieu(rs.getString("gioithieu"));
		upbook.setDongia(rs.getLong("soluong"));
		upbook.setSoluong(rs.getLong("dongia"));
		return upbook;
	}	
}
