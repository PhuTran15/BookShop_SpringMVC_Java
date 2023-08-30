package BookShop.Dao.User;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RestController;

import BookShop.Dto.CartDto;
import BookShop.Entity.User.Books;

@Repository
public class CartDao {
	@Autowired
	BookDao bookDao = new BookDao();

	public HashMap<Long, CartDto> AddCart(long id, HashMap<Long, CartDto> cart) {
		CartDto itemCart = new CartDto();
		Books product = bookDao.FindProductByID(id);
		if (product != null && cart.containsKey(id)){
			itemCart = cart.get(id);
			itemCart.setSoluong(itemCart.getSoluong() + 1);
			itemCart.setTotalPrice(itemCart.getSoluong() * itemCart.getProduct().getDongia());
		}
		else {
			itemCart.setProduct(product);
			itemCart.setSoluong(1);
			itemCart.setTotalPrice(product.getDongia());
		}
		cart.put(id, itemCart);
		return cart;
	}

	public HashMap<Long, CartDto> EditCart(long id, int quanty, HashMap<Long, CartDto> cart) {
		if (cart == null) {
			return cart;
		}
		CartDto itemCart = new CartDto();
		if (cart.containsKey(id)) {
			itemCart = cart.get(id);
			itemCart.setSoluong(quanty);
			double totalPrice = quanty * itemCart.getProduct().getDongia();
			itemCart.setTotalPrice(totalPrice);
		}
		cart.put(id, itemCart);
		return cart;
	}

	public HashMap<Long, CartDto> DeleteCart(long id, HashMap<Long, CartDto> cart) {
		if (cart == null) {
			return cart;
		}
		if (cart.containsKey(id)) {
			cart.remove(id);
		}
		return cart;
	}

	public int TotalQuanty(HashMap<Long, CartDto> cart) {
		int totalQuanty = 0;
		for (Map.Entry<Long, CartDto> itemCart : cart.entrySet()) {
			totalQuanty += itemCart.getValue().getSoluong();
		}
		return totalQuanty;
	}

	public double TotalPrice(HashMap<Long, CartDto> cart) {
		double totalPrice = 0;
		for (Map.Entry<Long, CartDto> itemCart : cart.entrySet()) {
			totalPrice += itemCart.getValue().getTotalPrice();
		}
		return totalPrice;
	}
}
