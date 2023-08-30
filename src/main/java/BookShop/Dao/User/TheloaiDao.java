package BookShop.Dao.User;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import BookShop.Entity.User.Books;
import BookShop.Entity.User.MapperBooks;
import BookShop.Entity.User.MapperTheLoai;
import BookShop.Entity.User.TheLoai;

@Repository
public class TheloaiDao {
	@Autowired
	public JdbcTemplate _jdbcTemplate;
	public List<TheLoai> GetDataTheloai(){
		List<TheLoai> list = new ArrayList<TheLoai>();
		String sql = "SELECT * FROM theloai";
		list = _jdbcTemplate.query(sql, new MapperTheLoai());
		return list;
	}
}
