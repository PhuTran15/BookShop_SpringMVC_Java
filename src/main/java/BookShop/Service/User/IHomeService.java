package BookShop.Service.User;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import BookShop.Dto.ProductDto;
import BookShop.Entity.User.Books;

@Service
public interface IHomeService {
	@Autowired
	public List<Books> GetDataBookAllProduct_Theloai();

	
	public List<Books> GetDataBook();
	
	public List<Books> GetProductIndexByID();
	
	public List<Books> GetNewProducts();
	public List<Books> GetRandProduct();
	public List<Books> GetRandProduct2();
	public List<Books> GetRandProduct3();
}
