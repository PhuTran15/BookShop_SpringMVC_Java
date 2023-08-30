package BookShop.Dao.User;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import BookShop.Entity.User.Lienhe;
import BookShop.Entity.User.MapperLienhe;

@Repository
public class LienheDao {

	@Autowired
	DataSource datasource;
	@Autowired
	public JdbcTemplate _jdbcTemplate;

	public List<Lienhe> GetDataLienhe() {
		List<Lienhe> list = new ArrayList<Lienhe>();
		String sql = "SELECT * FROM lienhe";
		list = _jdbcTemplate.query(sql, new MapperLienhe());
		return list;
	}

	public int AddContact(Lienhe lh) {
		StringBuffer sql = new StringBuffer();
		sql.append("INSERT ");
		sql.append("INTO lienhe ");
		sql.append("( ");
		sql.append("email, ");
		sql.append("tieude, ");
		sql.append("noidung ");
		sql.append(") ");
		sql.append("VALUES ");
		sql.append("( ");
		sql.append(" '" + lh.getEmail() + "', ");
		sql.append(" '" + lh.getTieude() + "', ");
		sql.append(" '" + lh.getNoidung() + "' ");
		sql.append(")");

		int insert = _jdbcTemplate.update(sql.toString());
		return insert;
	}
}
