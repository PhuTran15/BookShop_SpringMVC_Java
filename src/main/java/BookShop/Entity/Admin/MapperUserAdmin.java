package BookShop.Entity.Admin;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MapperUserAdmin implements RowMapper<UserAdmin> {
	public UserAdmin mapRow(ResultSet rs, int rowNum) throws SQLException {
		UserAdmin user = new UserAdmin();
		user.setUser(rs.getString("user"));
		user.setPasswords(rs.getString("passwords"));
		user.setShowname(rs.getString("showname"));
		user.setDiachi(rs.getString("diachi"));
		user.setQuyen(rs.getInt("quyen"));
		return user;
}
}
