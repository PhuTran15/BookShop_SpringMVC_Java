package BookShop.Dao.Admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import BookShop.Entity.Admin.MapperUserAdmin;
import BookShop.Entity.Admin.UserAdmin;
@Repository
public class UserDaoAdmin {
	@Autowired
	public JdbcTemplate _jdbcTemplate;
	
	public List<UserAdmin> GetDataUser(){
		List<UserAdmin> list = new ArrayList<UserAdmin>();
		String sql = "SELECT * FROM `users`";
		list = _jdbcTemplate.query(sql, new MapperUserAdmin());
		return list;
	}
	
	public int ThemQuyenUser(String id) {
		StringBuffer sql = new StringBuffer();
		sql.append("UPDATE `users` SET `quyen`= 1 WHERE user = " + "'" + id +"'");
		
		int up = _jdbcTemplate.update(sql.toString());
		return up; 
	}
	
	public int HuyQuyenUser(String id) {
		StringBuffer sql = new StringBuffer();
		sql.append("UPDATE `users` SET `quyen`= 0 WHERE user = " + "'" + id +"'");
		
		int down = _jdbcTemplate.update(sql.toString());
		return down; 
	}
	
	public int DelUser(String id) {
		StringBuffer sql = new StringBuffer();
		sql.append("DELETE FROM  `users` WHERE user = " + "'" + id +"'");
		
		int del = _jdbcTemplate.update(sql.toString());
		return del;
	}
}
