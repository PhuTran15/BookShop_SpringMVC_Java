package BookShop.Service.User;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import BookShop.Entity.User.Danhgia;

@Service
public interface IDanhgiaService {
	@Autowired
	public List<Danhgia> GetDataDanhgia();
	public int AddContact2(Danhgia dg);
	public Object DelBook(int id);
}
