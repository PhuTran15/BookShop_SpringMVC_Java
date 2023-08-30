package BookShop.Service.Admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import BookShop.Entity.Admin.BooksAdmin;
import BookShop.Entity.Admin.HoaDonAdmin;
import BookShop.Entity.Admin.TheLoaiAdmin;
import BookShop.Entity.Admin.UserAdmin;



@Service
public interface IHomeServiceAdmin {
	@Autowired
	public List<BooksAdmin> GetDataBook();
	
	public List<TheLoaiAdmin> GetDataTheLoai();
	
	public List<UserAdmin> GetDataUser();
	
	public List<HoaDonAdmin> GetDataHoaDon();
	
}
