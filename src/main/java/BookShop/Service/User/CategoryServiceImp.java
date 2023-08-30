package BookShop.Service.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

import BookShop.Dao.User.BookDao;
import BookShop.Entity.User.Books;


@Service
public class CategoryServiceImp implements ICategoryService{
	@Autowired
	private BookDao bookDao;
	public List<Books> GetProductsByLoai(int id) {
		return bookDao.GetProductsByLoai(id);
	}
}
