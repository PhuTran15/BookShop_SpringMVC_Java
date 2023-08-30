package BookShop.Dto;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;


public class ProductDtoMapper implements RowMapper<ProductDto>{

	public ProductDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		ProductDto product = new ProductDto();
		product.setIdloai(rs.getInt("idloai"));
		product.setIdbook(rs.getInt("idbook"));
		product.setIdtg(rs.getInt("idtg"));
		product.setTensach(rs.getString("tensach"));
		product.setSoluong(rs.getDouble("soluong"));
		product.setDongia(rs.getDouble("dongia"));
		product.setHinhanh(rs.getString("hinhanh"));	
		return product;
	}

}
