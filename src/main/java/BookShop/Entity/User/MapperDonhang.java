package BookShop.Entity.User;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MapperDonhang implements RowMapper<Donhang>  {

	public Donhang mapRow(ResultSet rs, int rowNum) throws SQLException {
		Donhang d = new Donhang();
		d.setIdhd(rs.getInt("idhd"));
		d.setNoigiao(rs.getString("noigiao"));
		d.setTiensach(rs.getInt("tiensach"));
		d.setTinhtrang(rs.getInt("tinhtrang"));
		d.setGiamgia(rs.getString("giamgia"));
		d.setIdbook(rs.getInt("idbook"));
		d.setSoluong(rs.getInt("soluong"));
		d.setDongia(rs.getInt("dongia"));
		d.setTensach(rs.getString("tensach"));
		d.setHinhanh(rs.getString("hinhanh"));
		
		return d;

	}

}
