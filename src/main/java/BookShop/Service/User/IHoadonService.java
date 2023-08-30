package BookShop.Service.User;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import BookShop.Dto.CartDto;
import BookShop.Entity.User.Hoadon;

@Service
public interface IHoadonService {
	@Autowired
	public int AddHoadon(Hoadon bills);
	
	public void AddChitietHD(HashMap<Long, CartDto> cart);
	
}
