package BookShop.Service.User;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import BookShop.Dao.User.LienheDao;
import BookShop.Entity.User.Lienhe;

@Service
public class LienheServiceImp implements ILienheService{
	
	@Autowired
	private LienheDao lienheDao;
	
	public List<Lienhe> GetDataLienhe() {
		return lienheDao.GetDataLienhe();
	}
	public int AddContact(Lienhe lienhe) {
		return lienheDao.AddContact(lienhe);
	}
}
