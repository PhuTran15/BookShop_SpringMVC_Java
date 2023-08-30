package BookShop.Dao.Admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import BookShop.Entity.Admin.AddBookAdmin;
import BookShop.Entity.Admin.BooksAdmin;
import BookShop.Entity.Admin.CtBookAdmin;
import BookShop.Entity.Admin.MapperBooksAdmin;
import BookShop.Entity.Admin.MapperCtBookAdmin;
import BookShop.Entity.Admin.UpBookAdmin;


@Repository
public class BookDaoAdmin {
	@Autowired
	public JdbcTemplate _jdbcTemplate;
	public List<BooksAdmin> GetDataBook(){
		List<BooksAdmin> list = new ArrayList<BooksAdmin>();
		String sql = "SELECT * FROM book";
		list = _jdbcTemplate.query(sql, new MapperBooksAdmin());
		return list;
	}
	
	
	public List<CtBookAdmin> GetDataBookByID(String cid){
		List<CtBookAdmin> list = new ArrayList<CtBookAdmin>();
		String sql = "SELECT book.idbook, book.idkm, book.idloai, "
				+ "book.tensach,theloai.tenloai,book.tacgia,book.tennxb,book.gioithieu,book.soluong,"
				+ "book.dongia,book.hinhanh from book "
				+ " INNER JOIN theloai ON book.idloai = theloai.idloai" 
				+  " where idbook =" + cid;
		list = _jdbcTemplate.query(sql, new MapperCtBookAdmin());
		return list;
	}
	
	public int DelBook(String id) {
		StringBuffer sql = new StringBuffer();
		sql.append("DELETE FROM `book` WHERE idbook = " + id);
		
		int del = _jdbcTemplate.update(sql.toString());
		return del;
	}
	
	public int AddBooks(AddBookAdmin addbook) {
		StringBuffer sql = new StringBuffer();
		sql.append("INSERT INTO `book` ");
		sql.append("            (`idloai`, ");
		sql.append("             `tensach`, ");
		sql.append("             `tacgia`, ");
		sql.append("             `tennxb`, ");
		sql.append("             `gioithieu`, ");
		sql.append("             `soluong`, ");
		sql.append("             `dongia`) ");
		sql.append("VALUES      ("+ "'" +addbook.getIdloai()+"'"+", ");
		sql.append("            '"+addbook.getTensach()+"'"+", ");
		sql.append("            '"+addbook.getTacgia()+"'"+", ");
		sql.append("            '"+addbook.getTennxb()+"'"+", ");
		sql.append("            '"+addbook.getGioithieu()+"'"+", ");
		sql.append("            '"+addbook.getSoluong()+"'"+", ");
		sql.append("            '"+addbook.getDongia()+"'"+")");
		
		
		int insert = _jdbcTemplate.update(sql.toString());
		return insert;
	}
	
	public int UpdateBook(UpBookAdmin upbook) {
		StringBuffer sql = new StringBuffer();
		sql.append("UPDATE `book` SET "
				+ "`idloai`= "+ "'" + upbook.getIdloai() + "'" + ","
				+ "`tensach`= "+ "'" + upbook.getTensach() + "'" + ","
				+ "`tacgia`= "+ "'" + upbook.getTacgia() + "'" + ","
				+ "`tennxb`= "+ "'" + upbook.getTennxb() + "'" + ","
				+ "`gioithieu`= "+ "'" + upbook.getGioithieu() + "'" + ","
				+ "`soluong`= " + "'" + upbook.getSoluong() + "'" + ","
				+ "`dongia`= " + "'" + upbook.getDongia() + "'"
				+ "WHERE idbook = " + upbook.getIdbook() );
		
		int insert = _jdbcTemplate.update(sql.toString());
		return insert;
	}
}
