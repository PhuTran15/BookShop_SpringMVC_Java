package BookShop.Service.User;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import BookShop.Dao.User.BookDao;
import BookShop.Entity.User.Books;

@Service
public class ProductServiceImp implements IProductService {
	@Autowired
	BookDao bookDao = new BookDao();
	public Books GetProductByID(int id) {
		List<Books> listProducts = bookDao.GetProductByID(id);
		return listProducts.get(0);
	}

}
