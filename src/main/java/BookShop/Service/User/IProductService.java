package BookShop.Service.User;

import java.util.List;

import org.springframework.stereotype.Service;

import BookShop.Dao.User.BookDao;
import BookShop.Entity.User.Books;

@Service
public interface IProductService {
	public Books GetProductByID(int id);
}
