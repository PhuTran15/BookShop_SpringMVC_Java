package BookShop.Service.User;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import BookShop.Dao.User.DanhgiaDao;
import BookShop.Entity.User.Danhgia;
import BookShop.Entity.User.Lienhe;

@Service
public class DanhgiaServiceImp implements IDanhgiaService{
	@Autowired
	private DanhgiaDao danhgiaDao;
	
	public List<Danhgia> GetDataDanhgiaById(int id) {
		return danhgiaDao.GetDataDanhgiaById(id);
	}
	public int AddContact2(Danhgia danhgia) {
		return danhgiaDao.AddContact2(danhgia);
	}
	public List<Danhgia> GetDataDanhgia() {
		return danhgiaDao.GetDataDanhgia();
	}
	public Object DelBook(int id) {
		return danhgiaDao.DelBook(id);
	}
}
