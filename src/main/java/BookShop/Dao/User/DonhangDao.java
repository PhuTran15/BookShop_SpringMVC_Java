package BookShop.Dao.User;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import BookShop.Entity.User.Books;
import BookShop.Entity.User.Donhang;
import BookShop.Entity.User.MapperBooks;
import BookShop.Entity.User.MapperDonhang;
import BookShop.Entity.User.MapperTheLoai;
import BookShop.Entity.User.TheLoai;

@Service
public class DonhangDao {
	@Autowired
	public JdbcTemplate _jdbcTemplate;
	
	private StringBuffer SqlString() {
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT * ");
		sql.append("FROM ");
		sql.append("hoadon AS h ");
		sql.append("INNER JOIN ");
		sql.append("chitiethoadon AS c ");
		sql.append("ON h.idhd = c.idhd ");
		sql.append("INNER JOIN ");
		sql.append("book AS b ");
		sql.append("ON c.idbook = b.idbook ");
		return sql;
	}
	
	private String SqlDonhangsById(int id) {
		StringBuffer sql = SqlString();
		sql.append("WHERE 1 = 1 ");
		sql.append("AND c.idhd = " + id + " ");
		return sql.toString();
	}
	
	public List<Donhang> GetDonhangsByID(int id) {
		String sql = SqlDonhangsById(id);
		List<Donhang> listProduct = _jdbcTemplate.query(sql, new MapperDonhang());
		return listProduct;
	}
	
	
	private String SqlDonhangByID() {
		StringBuffer sql = SqlString();
		sql.append(" ORDER BY h.idhd DESC LIMIT 1");
		return sql.toString();
	}
	
	public List<Donhang> GetDonhangByID() {
		String sql = SqlDonhangByID();
		List<Donhang> listProduct = _jdbcTemplate.query(sql, new MapperDonhang());
		return listProduct;
	}
}
