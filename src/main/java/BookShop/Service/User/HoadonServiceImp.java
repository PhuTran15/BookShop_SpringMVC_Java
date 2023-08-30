package BookShop.Service.User;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import BookShop.Dto.CartDto;
import BookShop.Dao.User.HoadonDao;
import BookShop.Entity.User.ChitietHD;
import BookShop.Entity.User.Hoadon;


@Service
public class HoadonServiceImp implements IHoadonService{
	@Autowired
	private HoadonDao Chitiet;
	public int AddHoadon(Hoadon bills) {
		return Chitiet.AddHoadon(bills);
	}
		public void AddChitietHD(HashMap<Long, CartDto> cart) {
		int idhd = (int) Chitiet.GetID();
		
		for(Map.Entry<Long, CartDto> itemCart : cart.entrySet()) {
			ChitietHD bills =  new ChitietHD();	
			bills.setIdhd(idhd);
			bills.setIdbook(itemCart.getValue().getProduct().getIdbook());
			bills.setQuanty(itemCart.getValue().getSoluong());
			bills.setDongia(itemCart.getValue().getProduct().getDongia());
			Chitiet.AddChitietHD(bills);
		}
		
			
	}

}
