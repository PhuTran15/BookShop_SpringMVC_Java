package BookShop.Service.User;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import BookShop.Dao.User.TheloaiDao;
import BookShop.Entity.User.TheLoai;
import BookShop.Entity.User.User;

@Service
public class TheLoaiServiceImp implements ITheLoaiService{
	@Autowired
	TheloaiDao theloaiDao = new TheloaiDao();

	public List<TheLoai> GetDataTheloai() {
		return theloaiDao.GetDataTheloai();
	}

}
