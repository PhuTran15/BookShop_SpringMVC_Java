package BookShop.Service.Admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import BookShop.Dao.Admin.BookDaoAdmin;
import BookShop.Dao.Admin.HoaDonDaoAdmin;
import BookShop.Dao.Admin.LienheAdminDao;
import BookShop.Dao.Admin.TheLoaiDaoAdmin;
import BookShop.Dao.Admin.UserDaoAdmin;
import BookShop.Entity.Admin.AddBookAdmin;
import BookShop.Entity.Admin.BooksAdmin;
import BookShop.Entity.Admin.HoaDonAdmin;
import BookShop.Entity.Admin.LienheAdmin;
import BookShop.Entity.Admin.TheLoaiAdmin;
import BookShop.Entity.Admin.UpBookAdmin;
import BookShop.Entity.Admin.UserAdmin;


@Service
@Repository
public class HomeServiceAdminImp implements IHomeServiceAdmin {

	@Autowired
	private BookDaoAdmin bookDao;
	@Autowired
	private TheLoaiDaoAdmin theLoaiDao;
	@Autowired
	private UserDaoAdmin userDao;
	@Autowired
	private HoaDonDaoAdmin hoadonDao;	
	@Autowired
	private LienheAdminDao lienheDao;
	
	public List<BooksAdmin> GetDataBook() {
		return bookDao.GetDataBook();
	}
	
	public List<TheLoaiAdmin> GetDataTheLoai() {
		return theLoaiDao.GetDataTheLoai();
	}
	
	public List<UserAdmin> GetDataUser(){
		return userDao.GetDataUser();
	}
	
	public Object ThemQuyenUser(String id) {
		return userDao.ThemQuyenUser(id);
	}
	
	public Object HuyQuyenUser(String id) {
		return userDao.HuyQuyenUser(id);
	}
	
	public Object DelUser(String id) {
		return userDao.DelUser(id);
	}
	
	public Object GetDataBookByID(String id) {
		return bookDao.GetDataBookByID(id);
	}

	public Object DelBook(String id) {
		return bookDao.DelBook(id);
	}
	

	public Object DelTheloai(String id) {
		return theLoaiDao.DelTheloai(id);
	}

	
	public List<HoaDonAdmin> GetDataHoaDon() {
		
		return hoadonDao.GetDataHoaDon();
	}
	
	public List<HoaDonAdmin> GetDataDanhSachHD(String id) {
		
		return hoadonDao.GetDataDanhSachHD(id);
	}
	
	public List<LienheAdmin> GetDataLienhe() {
		
		return lienheDao.GetDataLienhe();
	}
	
	public Object GetDataHDbyId(String id) {
		return hoadonDao.GetDataHDbyId(id);
	}

	public Object XacNhanHoaDon(String id) {
		
		return hoadonDao.XNHoaDon(id);
	}


	public Object HuyHoaDon(String id) {
		return hoadonDao.HuyHoaDon(id);
	}

	public int AddBooks(AddBookAdmin addbook) {
		int th = 0;
		if(!addbook.getTensach().isEmpty()) {
			if(!addbook.getTacgia().isEmpty()) {
				if(!addbook.getTennxb().isEmpty()) {
					int check = checkdatabook(addbook);
					if(check >0) {
						return bookDao.AddBooks(addbook);
					}
					return th;
				}
				return th;
			}
			return th;
		}
		return th;
	}
	
	public int UpdateBook(UpBookAdmin upbook) {
		int th = 0;
		if(!upbook.getTensach().isEmpty()) {
			if(!upbook.getTacgia().isEmpty()) {
				if(!upbook.getTennxb().isEmpty()) {
					if(!upbook.getGioithieu().isEmpty()) {
						int check = checkdataupbook(upbook);
						if(check >0) {
							return bookDao.UpdateBook(upbook);
						}
					}
				}
			}
		}
		return th;
	}
	
	public int AddTheLoai(TheLoaiAdmin addtheloai) {
		int th = 0;
		List<TheLoaiAdmin> listtheloai = theLoaiDao.GetDataTheLoai();
		String str1 = addtheloai.getTheloai().toLowerCase().replaceAll(" ","");
		for(int i = 0; i < listtheloai.size(); i++) {
			 String str2 = listtheloai.get(i).getTheloai().toLowerCase().replaceAll(" ","");
			if(str1.compareTo(str2) == 0) {
				return th;
			}
		}
		return th = theLoaiDao.AddTheloai(addtheloai);
	}
	
	public int UpTheLoai(TheLoaiAdmin uptheloai) {
		int th = 0;
		List<TheLoaiAdmin> listtheloai = theLoaiDao.GetDataTheLoai();
		String str1 = uptheloai.getTheloai().toLowerCase().replaceAll(" ","");
		for(int i = 0; i < listtheloai.size(); i++) {
			 String str2 = listtheloai.get(i).getTheloai().toLowerCase().replaceAll(" ","");
			if(str1.compareTo(str2) == 0) {
				return th;
			}
		}
		return th = theLoaiDao.UpTheloai(uptheloai);
	}
	
	public  int checkdatabook(AddBookAdmin addbook) {
		int th = 1;
		List<BooksAdmin> listbook = bookDao.GetDataBook();
		String str1 = addbook.getTensach().toLowerCase().replaceAll(" ","");
		String str2 = addbook.getTacgia().toLowerCase().replaceAll(" ","");
		String str3 = addbook.getTennxb().toLowerCase().replaceAll(" ","");
		for(int i = 0; i < listbook.size(); i++) {
			String strts = listbook.get(i).getTensach().toLowerCase().replaceAll(" ", "");
			if(str1.compareTo(strts)==0) {
				String strtg = listbook.get(i).getTacgia().toLowerCase().replaceAll(" ", "");
				if(str2.compareTo(strtg)==0) {
					String strnxb = listbook.get(i).getTennxb().toLowerCase().replaceAll(" ", "");
					if(str3.compareTo(strnxb)==0) {
						th = 0;
					}
				}
			}
		}
		return th;
	}
	
	public  int checkdataupbook(UpBookAdmin addbook) {
		int th = 1;
		List<BooksAdmin> listbook = bookDao.GetDataBook();
		String str1 = addbook.getTensach().toLowerCase().replaceAll(" ","");
		String str2 = addbook.getTacgia().toLowerCase().replaceAll(" ","");
		String str3 = addbook.getTennxb().toLowerCase().replaceAll(" ","");
		for(int i = 0; i < listbook.size(); i++) {
			String strts = listbook.get(i).getTensach().toLowerCase().replaceAll(" ", "");
			if(str1.compareTo(strts)==0) {
				String strtg = listbook.get(i).getTacgia().toLowerCase().replaceAll(" ", "");
				if(str2.compareTo(strtg)==0) {
					String strnxb = listbook.get(i).getTennxb().toLowerCase().replaceAll(" ", "");
					if(str3.compareTo(strnxb)==0) {
						th = 0;
					}
				}
			}
		}
		return th;
	}
	
}
