package BookShop.Service.User;

import java.util.List;

import org.springframework.stereotype.Service;

import BookShop.Entity.User.TheLoai;

@Service
public interface ITheLoaiService {
	public List<TheLoai> GetDataTheloai();
}
