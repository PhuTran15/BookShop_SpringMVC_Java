package BookShop.Service.User;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import BookShop.Entity.User.Lienhe;
import BookShop.Entity.User.User;

@Service
public interface ILienheService {
	
	@Autowired
	public List<Lienhe> GetDataLienhe();
	public int AddContact(Lienhe lienhe);
}
