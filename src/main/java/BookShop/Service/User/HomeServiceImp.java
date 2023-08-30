package BookShop.Service.User;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import BookShop.Dao.User.BookDao;
import BookShop.Entity.User.Books;

@Service
public class HomeServiceImp implements IHomeService {

	@Autowired
	BookDao bookDao = new BookDao();
//	private ProductDao productDao;
	
	public List<Books> GetDataBookAllProduct_Theloai() {
		return bookDao.GetDataBookAllProduct_Theloai();
	}
	
	public List<Books> GetDataBook() {
		return bookDao.GetDataBook();
	}
	
	
	public List<Books> GetProductIndexByID(){
		return bookDao.GetProductIndexByID();
	}
	
	public List<Books> GetNewProducts(){
		return bookDao.GetNewProducts();
	}
	public List<Books> GetRandProduct(){
		return bookDao.GetRandProduct();
	}
	public List<Books> GetRandProduct2(){
		return bookDao.GetRandProduct2();
	}
	public List<Books> GetRandProduct3(){
		return bookDao.GetRandProduct3();
	}
//	public List<ProductDto> GetDataProduct() {
//		List<ProductDto> listProduct = productDao.GetDataProduct();
//		return listProduct;
//	}
}
