package BookShop.Service.User;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import BookShop.Entity.User.Books;
import BookShop.Entity.User.Donhang;

@Service
public interface IDonhangService {
	@Autowired
	public List<Donhang> GetDonhangsById(int id);
	public Donhang GetDonhangById();
}
