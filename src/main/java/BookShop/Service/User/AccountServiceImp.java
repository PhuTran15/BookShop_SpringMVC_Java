package BookShop.Service.User;

import java.util.List;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import BookShop.Dao.User.UserDao;
import BookShop.Entity.User.User;

@Service
public class AccountServiceImp implements IAccountService {

	@Autowired
	private UserDao userDao;

	public List<User> GetDataUser() {
		return userDao.GetDataUser();
	}

	public int AddAccount(User user) {
		user.setPasswords(BCrypt.hashpw(user.getPasswords(), BCrypt.gensalt(10)));
		return userDao.AddAccount(user);
	}
	
	public boolean CheckUser(User user) {
		user = userDao.GetUser(user);
		if (user != null) {
			return false;
		}
		return true;
	}
	
	public User GetUser(User user) {
		return userDao.GetUser(user);
	}

	public User CheckAccount(User user) {
		String pw = user.getPasswords();
		user = userDao.GetUser(user);
		if (user != null) {
			if (BCrypt.checkpw(pw, user.getPasswords())) {
				return user;
			} else {
				return null;
			}
		}

		return null;


	}

}
