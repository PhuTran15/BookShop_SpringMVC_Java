package BookShop.Service.User;
import java.util.List;

import org.springframework.stereotype.Service;

import BookShop.Entity.User.Books;

@Service
public interface ICategoryService {
	public List<Books> GetProductsByLoai(int id);
}
