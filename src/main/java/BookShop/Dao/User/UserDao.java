package BookShop.Dao.User;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import BookShop.Entity.User.Books;
import BookShop.Entity.User.Login;
import BookShop.Entity.User.MapperBooks;
import BookShop.Entity.User.MapperUser;
import BookShop.Entity.User.User;

@Repository
public class UserDao {
	
	@Autowired
	DataSource datasource;
	@Autowired
	public JdbcTemplate _jdbcTemplate;
	public List<User> GetDataUser(){
		List<User> list = new ArrayList<User>();
		String sql = "SELECT * FROM users";
		list = _jdbcTemplate.query(sql, new MapperUser());
		return list;
	}
	public int AddAccount (User user) {
		StringBuffer sql = new StringBuffer();
		sql.append("INSERT ");
		sql.append("INTO users ");
		sql.append("( ");
		sql.append("user, ");
		sql.append("passwords, ");
		sql.append("showname, ");
		sql.append("diachi, ");
		sql.append("sodienthoai, ");
		sql.append("quyen ");
		sql.append(") ");
		sql.append("VALUES ");
		sql.append("( ");
		sql.append(" '"+user.getUser()+"', ");
		sql.append(" '"+user.getPasswords()+"', ");
		sql.append(" '"+user.getShowname()+"', ");
		sql.append(" '"+user.getDiachi()+"', ");
		sql.append(" '"+user.getSodienthoai()+"', ");
		sql.append(" '"+0+"' ");
		sql.append(")");
		
		
		int insert = _jdbcTemplate.update(sql.toString());
		return insert;
	}
	
	public User GetUser (User user) {
		String sql = "SELECT * FROM users WHERE user = '"+user.getUser()+"'";
		try {
			User rs = _jdbcTemplate.queryForObject(sql, new MapperUser());
			return rs;
		}catch(EmptyResultDataAccessException e){
			return null;
		}
	}
	
//	public void register(User user) {
//
//	    String sql = "insert into users values(?,?,?,?,?,?,?)";
//
//	    _jdbcTemplate.update(sql, new Object[] { user.getUser(), user.getPasswords(), user.getShowname(),
//	    user.getDiachi()});
//	    }
//
//	    public User validateUser(Login login) {
//
//	    String sql = "select * from users where username='" + login.getUsername() + "' and password='" + login.getPassword()
//	    + "'";
//
//	    List<User> users = _jdbcTemplate.query(sql, new MapperUser());
//
//	    return users.size() > 0 ? users.get(0) : null;
//	    }
//
//	  }
	
}
