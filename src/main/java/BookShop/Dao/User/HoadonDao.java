package BookShop.Dao.User;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;


import BookShop.Entity.User.ChitietHD;
import BookShop.Entity.User.Hoadon;
import BookShop.Entity.User.MapperHoadon;

@Repository
public class HoadonDao {
	
	@Autowired
	DataSource datasource;
	@Autowired
	public JdbcTemplate _jdbcTemplate;
	public List<Hoadon> GetDatachitiethoadon(){
		List<Hoadon> list = new ArrayList<Hoadon>();
		String sql = "SELECT * FROM hoadon";
		list = _jdbcTemplate.query(sql, new MapperHoadon());
		return list;
	}	
	
//	CURDATE date = new DATE(NOW());
	public int AddHoadon (Hoadon chitiet) {
		StringBuffer sql = new StringBuffer();
		sql.append("INSERT ");
		sql.append("INTO hoadon ");
		sql.append("( ");
		sql.append("idhd, ");
		sql.append("user, ");
		sql.append("ngaydh, ");
		sql.append("ngaygh, ");
		sql.append("noigiao, ");
		sql.append("sdtgiaohang, ");
		sql.append("Tiensach, ");
		sql.append("giamgia ");
		sql.append(") ");
		sql.append("VALUES ");
		sql.append("( ");	
		sql.append(" '"+chitiet.getIdhd()+"', ");
		sql.append(" '"+chitiet.getUser()+"', ");
		sql.append(""+"CURDATE()"+",");
		sql.append(""+"Adddate(CURDATE(),3)"+",");
		sql.append(" '"+chitiet.getDiachi()+"', ");
		sql.append(" '"+chitiet.getPhone()+"', ");
		sql.append(" '"+chitiet.getTotalPrice()+"', ");
		sql.append(" '"+chitiet.getGiamgia()+"' ");
		
		sql.append(")");
		
		
		int insert = _jdbcTemplate.update(sql.toString());
		return insert;
	}
	
	public long GetID() {
		StringBuffer sql = new StringBuffer();	
		sql.append("SELECT MAX(idhd) FROM hoadon;");
		long id = _jdbcTemplate.queryForObject(sql.toString(), new Object[] {}, Long.class);
		return id;
	};
	
	public int AddChitietHD(ChitietHD bills) {
		StringBuffer sql = new StringBuffer();
		sql.append("INSERT ");
		sql.append("INTO chitiethoadon ");
		sql.append("( ");
		sql.append("idhd, ");
		sql.append("idbook, ");
		sql.append("soluong, ");
		sql.append("dongia ");
		sql.append(") ");
		sql.append("VALUES ");
		sql.append("( ");
		sql.append(" '"+bills.getIdhd()+"', ");
		sql.append(" '"+bills.getIdbook()+"', ");
		sql.append(" '"+bills.getQuanty()+"', ");
		sql.append(" '"+bills.getDongia()+"' ");
		sql.append(")");
		
		
		int insert = _jdbcTemplate.update(sql.toString());
		return insert;
	}
	
}

