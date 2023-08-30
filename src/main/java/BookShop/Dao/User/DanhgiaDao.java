package BookShop.Dao.User;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import BookShop.Entity.User.Books;
import BookShop.Entity.User.Danhgia;
import BookShop.Entity.User.MapperBooks;
import BookShop.Entity.User.MapperDanhgia;


@Repository
public class DanhgiaDao {
	@Autowired
	DataSource datasource;
	@Autowired
	public JdbcTemplate _jdbcTemplate;

	public List<Danhgia> GetDataDanhgia() {
		List<Danhgia> list = new ArrayList<Danhgia>();
		String sql = "SELECT * FROM danhgia";
		list = _jdbcTemplate.query(sql, new MapperDanhgia());
		return list;
	}

	public int AddContact2(Danhgia dg) {
		StringBuffer sql = new StringBuffer();
		sql.append("INSERT ");
		sql.append("INTO danhgia ");
		sql.append("( ");
		sql.append("idbook, ");
		sql.append("noidung ");
		sql.append(") ");
		sql.append("VALUES ");
		sql.append("( ");
		sql.append(" '" + dg.getIdbook() + "', ");
		sql.append(" '" + dg.getNoidung() + "' ");
		sql.append(")");

		int insert = _jdbcTemplate.update(sql.toString());
		return insert;
	}
	
//	public List<Danhgia> GetDataDanhgiaById() {
//		List<Danhgia> list = new ArrayList<Danhgia>();
//		String sql = "SELECT * FROM danhgia";
//		list = _jdbcTemplate.query(sql, new MapperDanhgia());
//		return list;
//	}
	
	private StringBuffer DataDanhgiaById(int id) {
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT * FROM danhgia ");
		sql.append("WHERE 1 = 1 ");
		sql.append("AND idbook = " + id + " ");
		sql.append(" ORDER BY iddanhgia DESC LIMIT 3");
//		list = _jdbcTemplate.query(sql, new MapperDanhgia());
		return sql;
	}
	
	public List<Danhgia> GetDataDanhgiaById(int id) {
		String sql = DataDanhgiaById(id).toString();
		List<Danhgia> listProduct = _jdbcTemplate.query(sql, new MapperDanhgia());
		return listProduct;
	}
	
	public int DelBook(int id) {
		StringBuffer sql = new StringBuffer();
		sql.append("DELETE FROM `danhgia` WHERE iddanhgia = " + id);
		
		int del = _jdbcTemplate.update(sql.toString());
		return del;
	}
}
