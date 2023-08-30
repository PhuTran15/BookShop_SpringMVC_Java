package BookShop.Dao.Admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import BookShop.Entity.Admin.MapperTheLoaiAdmin;
import BookShop.Entity.Admin.TheLoaiAdmin;



@Repository
public class TheLoaiDaoAdmin {
	@Autowired
	public JdbcTemplate _jdbcTemplate;
	public List<TheLoaiAdmin> GetDataTheLoai(){
		List<TheLoaiAdmin> list = new ArrayList<TheLoaiAdmin>();
		String sql = "SELECT * FROM theloai";
		list = _jdbcTemplate.query(sql, new MapperTheLoaiAdmin());
		return list;
	}

	public int DelTheloai(String id) {
		StringBuffer sql = new StringBuffer();
		sql.append("DELETE FROM `theloai` WHERE idloai = " + id);
		
		int del = _jdbcTemplate.update(sql.toString());
		return del;
	}
	
	public int AddTheloai(TheLoaiAdmin addtheloai) {
		StringBuffer sql = new StringBuffer();
		sql.append("INSERT INTO `theloai`(`tenloai`) "
				+ "VALUES (" + "'"+ addtheloai.getTheloai() + "'" + ")");
		
		int del = _jdbcTemplate.update(sql.toString());
		return del;
	}
	
	public int UpTheloai(TheLoaiAdmin uptheloai) {
		StringBuffer sql = new StringBuffer();
		sql.append("UPDATE `theloai` SET `tenloai`= " + "'" + uptheloai.getTheloai() + "'" 
					+  " WHERE idloai = " + uptheloai.getIdloai());
		int del = _jdbcTemplate.update(sql.toString());
		return del;
	}

}
