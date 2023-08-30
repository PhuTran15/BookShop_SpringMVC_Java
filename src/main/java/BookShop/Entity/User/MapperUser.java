package BookShop.Entity.User;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MapperUser implements RowMapper<User> {
	public User mapRow(ResultSet rs, int rowNum) throws SQLException {
		User user = new User();
		user.setUser(rs.getString("user"));
		user.setPasswords(rs.getString("passwords"));
		user.setShowname(rs.getString("showname"));
		user.setDiachi(rs.getString("diachi"));
		user.setSodienthoai(rs.getString("sodienthoai"));
		user.setQuyen(rs.getInt("quyen"));
		return user;
}
}
