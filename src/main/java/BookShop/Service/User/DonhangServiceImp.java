package BookShop.Service.User;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import BookShop.Dao.User.BookDao;
import BookShop.Dao.User.DonhangDao;
import BookShop.Entity.User.Books;
import BookShop.Entity.User.Donhang;

@Service
public class DonhangServiceImp implements IDonhangService{

	@Autowired
	private DonhangDao donhangDao;

	public Donhang GetDonhangById() {
		List<Donhang> listProducts = donhangDao.GetDonhangByID();
		return listProducts.get(0);
	}

	public List<Donhang> GetDonhangsById(int id) {
		return donhangDao.GetDonhangsByID(id);
	}


}
