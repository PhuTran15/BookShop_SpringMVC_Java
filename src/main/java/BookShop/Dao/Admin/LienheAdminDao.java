package BookShop.Dao.Admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import BookShop.Entity.Admin.LienheAdmin;
import BookShop.Entity.Admin.MapperLienheAdmin;

@Repository
public class LienheAdminDao {
	@Autowired
	public JdbcTemplate _jdbcTemplate;
	
	public List<LienheAdmin> GetDataLienhe(){
		List<LienheAdmin> list = new ArrayList<LienheAdmin>();
		String sql = "SELECT * FROM lienhe";
		list = _jdbcTemplate.query(sql, new MapperLienheAdmin());
		return list;
	}
}
