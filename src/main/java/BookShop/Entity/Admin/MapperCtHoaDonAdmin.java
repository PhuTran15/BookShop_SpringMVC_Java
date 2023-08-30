package BookShop.Entity.Admin;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MapperCtHoaDonAdmin implements RowMapper<CtHoaDonAdmin>{

	public CtHoaDonAdmin mapRow(ResultSet rs, int rowNum) throws SQLException {
		CtHoaDonAdmin cthoadon = new CtHoaDonAdmin();
		cthoadon.setIdhd(rs.getInt("idhd"));
		cthoadon.setIdbook(rs.getInt("idbook"));
		cthoadon.setTensach(rs.getString("tensach"));
		cthoadon.setSoluong(rs.getInt("soluong"));
		cthoadon.setDongia(rs.getLong("dongia"));
//		cthoadon.setGiamgia(rs.getLong("giamgia"));
		return cthoadon;
	}

}
