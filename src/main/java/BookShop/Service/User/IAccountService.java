package BookShop.Service.User;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import BookShop.Entity.User.Login;
import BookShop.Entity.User.User;

@Service
public interface IAccountService {
	@Autowired
	public List<User> GetDataUser();
	
	public int AddAccount(User user);
	
	public boolean CheckUser(User user);
	
	public User CheckAccount(User user);
	

}
