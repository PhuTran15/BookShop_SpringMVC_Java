package BookShop.UserController;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import BookShop.Service.User.HomeServiceImp;
@Controller
public class BaseController {
	
//	Dùng cho những thứ dùng chung cho cả trang như thanh menu
//	@Autowired
//	HomeServiceImp _homeService;
//	public ModelAndView _mvShare = new ModelAndView();
//	PostContruct dùng để gọi thằng Init đầu tiên 
//	@PostConstruct
//	public ModelAndView Init () {
//		_mvShare.addObject("menus", _homeService.GetDataMenu());
//		return _mvShare;
//	}
}
