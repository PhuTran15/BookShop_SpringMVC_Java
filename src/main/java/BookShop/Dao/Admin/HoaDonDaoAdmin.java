package BookShop.Dao.Admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import BookShop.Entity.Admin.CtHoaDonAdmin;
import BookShop.Entity.Admin.HoaDonAdmin;
import BookShop.Entity.Admin.MapperCtHoaDonAdmin;
import BookShop.Entity.Admin.MapperHoaDonAdmin;


@Repository
public class HoaDonDaoAdmin {
	@Autowired
	public JdbcTemplate _jdbcTemplate;
	
	public List<HoaDonAdmin> GetDataHoaDon(){
		List<HoaDonAdmin> list = new ArrayList<HoaDonAdmin>();
		String sql = "SELECT * FROM hoadon";
		list = _jdbcTemplate.query(sql, new MapperHoaDonAdmin());
		return list;
	}
	
	public List<HoaDonAdmin> GetDataDanhSachHD(String id){
		List<HoaDonAdmin> list = new ArrayList<HoaDonAdmin>();
		String sql = "SELECT * FROM hoadon WHERE tinhtrang = " + id;
		list = _jdbcTemplate.query(sql, new MapperHoaDonAdmin());
		return list;
	}
	
	public List<CtHoaDonAdmin> GetDataHDbyId(String id){
		List<CtHoaDonAdmin> list = new ArrayList<CtHoaDonAdmin>();
		String sql = "SELECT chitiethoadon.idhd,chitiethoadon.idbook,book.tensach, chitiethoadon.soluong, "
				+ "chitiethoadon.dongia "
				+ "FROM chitiethoadon INNER JOIN book ON chitiethoadon.idbook = book.idbook "
				+ "WHERE idhd = " + id;
		list = _jdbcTemplate.query(sql, new MapperCtHoaDonAdmin());
		return list;
	}
	
	public int XNHoaDon(String id) {
		StringBuffer sql = new StringBuffer();
		sql.append("UPDATE `hoadon` SET `tinhtrang`= 2 WHERE idhd = " + id);
		
		int up = _jdbcTemplate.update(sql.toString());
		return up; 
	}
	
	public int HuyHoaDon(String id) {
		StringBuffer sql = new StringBuffer();
		sql.append("UPDATE `hoadon` SET `tinhtrang`= 0 WHERE idhd = " + id);
		
		int del = _jdbcTemplate.update(sql.toString());
		return del; 
	}


}
