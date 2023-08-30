package BookShop.UserController;

import java.io.Console;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import BookShop.Dao.User.BookDao;
import BookShop.Dto.CartDto;
import BookShop.Entity.User.Books;
import BookShop.Entity.User.Danhgia;
import BookShop.Entity.User.Lienhe;
import BookShop.Entity.User.Login;
import BookShop.Entity.User.User;
import BookShop.Service.User.AccountServiceImp;
import BookShop.Service.User.CartServiceImp;
import BookShop.Service.User.CategoryServiceImp;
import BookShop.Service.User.DanhgiaServiceImp;
import BookShop.Service.User.DonhangServiceImp;
import BookShop.Service.User.HoadonServiceImp;
import BookShop.Service.User.HomeServiceImp;
import BookShop.Service.User.IProductService;
import BookShop.Service.User.ITheLoaiService;
import BookShop.Service.User.LienheServiceImp;
import BookShop.Entity.User.Hoadon;
import BookShop.Entity.Admin.AddBookAdmin;
import BookShop.Entity.Admin.TheLoaiAdmin;
import BookShop.Entity.Admin.UpBookAdmin;
import BookShop.Service.Admin.HomeServiceAdminImp;

@Controller
public class HomeController {
	@Autowired
	HomeServiceImp HomeService;
	@Autowired
	private ITheLoaiService theloaiService;
	
	@Autowired
	AccountServiceImp AccountService = new AccountServiceImp();
	
	@RequestMapping(value = { "/", "trang-chu"})
	public ModelAndView Index(HttpSession session, HttpServletRequest request, @ModelAttribute("user") User user) {
		ModelAndView mv = new ModelAndView("user/index");
		mv.addObject("theloai", theloaiService.GetDataTheloai());
		
		mv.addObject("user", new User());
		mv.addObject("newproduct", HomeService.GetNewProducts());
		mv.addObject("randsp", HomeService.GetRandProduct());
		mv.addObject("randsp2", HomeService.GetRandProduct2());
		mv.addObject("randsp3", HomeService.GetRandProduct3());
		mv.addObject("ranran", HomeService.GetProductIndexByID());
		
		return mv;
	}
			
	
	@RequestMapping(value = { "product"})
	public ModelAndView Product() {
		ModelAndView mv = new ModelAndView("user/product");
		mv.addObject("theloaisp", theloaiService.GetDataTheloai());
		mv.addObject("newproduct", HomeService.GetNewProducts());
		
		mv.addObject("product_all", HomeService.GetDataBookAllProduct_Theloai());
		
		mv.addObject("user", new User());
		return mv;
	}
	
	
	@Autowired
	DonhangServiceImp donhangService = new DonhangServiceImp();
	@RequestMapping(value = { "don-hang"})
	public ModelAndView Donhang() {
		ModelAndView mv = new ModelAndView("user/donhang");
		int id = donhangService.GetDonhangById().getIdhd();
		mv.addObject("donhanguser", donhangService.GetDonhangsById(id));
		return mv;
	}
	
	@RequestMapping(value = { "gioi-thieu"})
	public ModelAndView Gioithieu() {
		ModelAndView mv = new ModelAndView("user/gioithieu");
		mv.addObject("user", new User());
		return mv;
	}
	
	@RequestMapping(value = { "news"})
	public ModelAndView News() {
		ModelAndView mv = new ModelAndView("user/news");
		mv.addObject("user", new User());
		mv.addObject("theloai", theloaiService.GetDataTheloai());
		mv.addObject("randsp3", HomeService.GetRandProduct3());
		
		return mv;
	}
	
	@RequestMapping(value = "thanh-toan", method = RequestMethod.GET)
	public ModelAndView Thanhtoan(HttpServletRequest request, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/thanhtoan");
		mv.addObject("bills", new Hoadon());
		mv.addObject("user", new User());
		mv.addObject("randsp3", HomeService.GetRandProduct3());
		return mv;
	}
	
	@Autowired
	HoadonServiceImp chitietService = new HoadonServiceImp();
	@RequestMapping(value = "thanh-toan", method = RequestMethod.POST)
	public String Thanhtoan(HttpServletRequest request, HttpSession session, @ModelAttribute("bills") Hoadon bills) {	
		ModelAndView mv = new ModelAndView("user/giohang");
		mv.addObject("user", new User());
		mv.addObject("randsp3", HomeService.GetRandProduct3());
		Books book = new Books();
		Hoadon hd = new Hoadon();
//		double rannum = Math.random() * (50000 - 1000 + 1) + 1000;
		if(chitietService.AddHoadon(bills) > 0)	 {
			HashMap<Long, CartDto> cart = (HashMap<Long, CartDto>) session.getAttribute("Cart");
			String string= session.getAttribute("TotalQuantyCart").toString();
			chitietService.AddChitietHD(cart);
//			hd.setMadh(Double.toString(rannum));
		}
	
		mv.addObject("thongbao", "Đặt hàng thành công");
		session.removeAttribute("Cart");
		session.setAttribute("kiemtradh", donhangService.GetDonhangById().getIdhd());
		double y = Math.random() * (50000 - 1000 + 1) + 1000;
		session.setAttribute("randomnumber", (int)y);
		session.setAttribute("testvalue", y);
		session.removeAttribute("TotalPriceCart");
		session.removeAttribute("TotalQuantyCart");
		return ("redirect:gio-hang");
	}
	
	@RequestMapping(value = { "lien-he"}, method = RequestMethod.GET)
	public ModelAndView Dangky1(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("user/lienhe");
		mv.addObject("lienhe", new Lienhe());
		mv.addObject("user", new User());
		return mv;
	}
	
	@Autowired
	LienheServiceImp lienheService = new LienheServiceImp();
	@RequestMapping(value = { "lien-he","chi-tiet-san-pham/lien-he"}, method = RequestMethod.POST, produces = "application/x-www-form-urlencoded;charset=UTF-8")
	public ModelAndView Taolienhe(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("lienhe") Lienhe lienhe) {
		ModelAndView mv = new ModelAndView();
		int count = lienheService.AddContact(lienhe);

		mv.setViewName("redirect:"+request.getHeader("Referer"));
		return mv;
	}
	
	@RequestMapping(value = { "gio-hang"})
	public ModelAndView Giohang() {
		ModelAndView mv = new ModelAndView("user/giohang");
		mv.addObject("user", new User());
		return mv;
	}
	
	@RequestMapping(value = { "dang-ky"}, method = RequestMethod.GET)
	public ModelAndView Dangky(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("user/dangky");
		mv.addObject("user", new User());
		mv.addObject("theloaidk", theloaiService.GetDataTheloai());
		return mv;
	}

	@RequestMapping(value = { "dang-ky"}, method = RequestMethod.POST, produces = "application/x-www-form-urlencoded;charset=UTF-8")
	public ModelAndView Taotk(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("user") User user, ModelMap mm, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		int count = AccountService.AddAccount(user);
		if (count>0) {
			mv.addObject("statuslg", "Đăng ký thành công");
			session.removeAttribute("statuslg");
			session.removeAttribute("statuslg2");
		}
		else {
			mv.addObject("statuslg", "Tài khoản đã tồn tại");
		}
		mv.setViewName("user/dangky");
		return mv;
	}
	@RequestMapping(value = { "dang-nhap"}, method = RequestMethod.POST, produces = "application/x-www-form-urlencoded;charset=UTF-8")
	public ModelAndView Dangnhap(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("user") User user, ModelMap mm, HttpSession session) {
		user = AccountService.CheckAccount(user);
		ModelAndView mv = new ModelAndView();
//		User userquyen = AccountService.GetUser(user);
//		session.setAttribute("adminpage", user.getQuyen());
//		if (userquyen.getQuyen()==1) {
//			mv.setViewName("admin/index");
//			mv.addObject("books", HomeServiceAdmin.GetDataBook());
//			mv.addObject("theloais", HomeServiceAdmin.GetDataTheLoai());
//		}
//		else {
		if (user != null) {
				session.setAttribute("adminpage", user.getQuyen());
				session.setAttribute("showname", user.getShowname());
				session.setAttribute("useremail", user.getUser());
				mv.setViewName("redirect:trang-chu");
		}
		else {
				String err = "Đăng nhập thất bại, xin vui lòng kiểm tra lại thông tin đăng nhập";
				String err2 = "(Nếu chưa có tài khoản, điền thông tin đăng ký dưới đây)";
//				mv.setViewName("error page");
//				mv = new ModelAndView("user/dangky");
				mv.setViewName("redirect:dang-ky");
				session.setAttribute("statuslg", err);
				session.setAttribute("statuslg2", err2);
				
		}
		session.setAttribute("kiemtradh", donhangService.GetDonhangById().getIdhd());
		
		return mv;
	}
	
	@RequestMapping(value = { "dang-xuat"}, method = RequestMethod.GET, produces = "application/x-www-form-urlencoded;charset=UTF-8")
	public ModelAndView Dangnhap(HttpServletRequest request, HttpServletResponse response, ModelMap mm, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		session.removeAttribute("showname");
		session.removeAttribute("kiemtradh");
		session.removeAttribute("randomnumber");
		session.removeAttribute("testvalue");
		session.removeAttribute("adminpage");
		session.removeAttribute("statuslg");
		session.removeAttribute("statuslg2");
		mv.setViewName("redirect:trang-chu");
//		return "redirect:"+request.getHeader("Referer");
		return mv;
	}
	
	
	@Autowired
	private IProductService _productService;
	@Autowired
	DanhgiaServiceImp danhgiaService = new DanhgiaServiceImp();
	
	@RequestMapping(value = { "chi-tiet-san-pham/{id}" })
	public ModelAndView Chitiet(@PathVariable int id) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("user", new User());
		mv.addObject("lienhe", new Lienhe());
		mv.addObject("danhgia", new Danhgia());
		mv.setViewName("user/chitietsp");
		int id1 = _productService.GetProductByID(id).getIdloai();
		mv.addObject("product1", _productService.GetProductByID(id));
		mv.addObject("idloaisp", categoryService.GetProductsByLoai(id1));
		mv.addObject("danhgiabook", danhgiaService.GetDataDanhgiaById(id));
//		int idCategory = _productService.GetProductByID(id).getId_category();
//		mv.addObject("productByIDCategory", _productService.GetProductByIDCategory(idCategory));
		return mv;
	}
	
//	private DanhgiaServiceImp danhgiaService;
	@RequestMapping(value = { "danh-gia", "chi-tiet-san-pham/danh-gia"}, method = RequestMethod.POST, produces = "application/x-www-form-urlencoded;charset=UTF-8")
	public ModelAndView Taodanhgia(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("danhgia") Danhgia danhgia) {
		ModelAndView mv = new ModelAndView();
		
		int count2 = danhgiaService.AddContact2(danhgia);

		mv.setViewName("redirect:"+request.getHeader("Referer"));
		return mv;
	}
	
	@Autowired
	private CategoryServiceImp categoryService;
	@RequestMapping(value = "/product/{id}")
	public ModelAndView Product(@PathVariable String id) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/category");	
//		int totalData = categoryService.GetProductsByLoai(Integer.parseInt(id)).size();
		mv.addObject("idCategory", categoryService.GetProductsByLoai(Integer.parseInt(id)));
		mv.addObject("theloaiall", theloaiService.GetDataTheloai());
		mv.addObject("user", new User());
		mv.addObject("newproduct", HomeService.GetNewProducts());

		return mv;
	}
	
	@Autowired
	private CartServiceImp cartService = new CartServiceImp();
	@RequestMapping(value = "/AddCart/{id}")
	public String AddCart(HttpServletRequest request, HttpSession session, @PathVariable long id) {
		HashMap<Long, CartDto> cart = (HashMap<Long, CartDto>)session.getAttribute("Cart");
		ModelAndView mv = new ModelAndView();
		if (cart==null) {
			cart = new HashMap<Long, CartDto>();
			mv.addObject("tt", "Giỏ hàng hiện không có sản phẩm nào");
		}
		cart = cartService.AddCart(id, cart);
		session.setAttribute("Cart", cart);
		session.setAttribute("TotalQuantyCart", cartService.TotalQuanty(cart));
		session.setAttribute("TotalPriceCart", cartService.TotalPrice(cart));
//		return "redirect: /chi-tiet-san-pham/"+id;
		return "redirect:"+request.getHeader("Referer");
	}
	
	@RequestMapping(value = "EditCart/{id}/{quanty}")
	public String EditCart(HttpServletRequest request, HttpSession session, @PathVariable long id, @PathVariable int quanty) {
		HashMap<Long, CartDto> cart = (HashMap<Long, CartDto>)session.getAttribute("Cart");
		if (cart==null) {
			cart = new HashMap<Long, CartDto>();
		}
		cart = cartService.EditCart(id, quanty, cart);
		session.setAttribute("Cart", cart);
		session.setAttribute("TotalQuantyCart", cartService.TotalQuanty(cart));
		session.setAttribute("TotalPriceCart", cartService.TotalPrice(cart));
		return "redirect:"+request.getHeader("Referer");
	}
	
	@RequestMapping(value = "DeleteCart/{id}")
	public String DeleteCart(HttpServletRequest request, HttpSession session, @PathVariable long id) {
		HashMap<Long, CartDto> cart = (HashMap<Long, CartDto>)session.getAttribute("Cart");
		if (cart==null) {
			cart = new HashMap<Long, CartDto>();
		}
		cart = cartService.DeleteCart(id, cart);
		session.setAttribute("Cart", cart);
		session.setAttribute("TotalQuantyCart", cartService.TotalQuanty(cart));
		session.setAttribute("TotalPriceCart", cartService.TotalPrice(cart));
		return "redirect:"+request.getHeader("Referer");
	}
	
	
	
	
	
	@Autowired
	HomeServiceAdminImp HomeServiceAdmin;
	
	@RequestMapping(value = { "/admin", "/trang-chu-admin"})
	public ModelAndView IndexAdmin() {
		ModelAndView mv = new ModelAndView("admin/index");
		mv.addObject("books", HomeServiceAdmin.GetDataBook());
		mv.addObject("theloais", HomeServiceAdmin.GetDataTheLoai());
		return mv;
	}
	
	@RequestMapping(value = { "/xoabook/{id}"})
	public ModelAndView xoa(@PathVariable String id, HttpServletRequest rq) {
		ModelAndView mv = new ModelAndView("admin/index");
		mv.addObject("theloais", HomeServiceAdmin.DelBook(id));
		mv.addObject("books", HomeServiceAdmin.GetDataBook());
		mv.addObject("theloais", HomeServiceAdmin.GetDataTheLoai());
		return mv; 
	}
	
	@RequestMapping(value = { "/themsanpham"})
	public ModelAndView themsanpham() {
		ModelAndView mv = new ModelAndView("admin/themsanpham");
		mv.addObject("theloai", HomeServiceAdmin.GetDataTheLoai());
		return mv;
	}
	
	@RequestMapping(value = { "/chitietsanpham/{id}"})
	public ModelAndView chitietsanpham(@PathVariable String id) {
		ModelAndView mv = new ModelAndView("admin/chitietsanpham");  	
		mv.addObject("idbooks", id);
		mv.addObject("books1", HomeServiceAdmin.GetDataBookByID(id));
		return mv;
	}
	
	@RequestMapping(value = { "/chinhsua/{id}"})
	public ModelAndView chinhsua(@PathVariable String id) {
		ModelAndView mv = new ModelAndView("admin/chinhsua");  	
		mv.addObject("idbooks", id);
		mv.addObject("books1", HomeServiceAdmin.GetDataBookByID(id));
		return mv;
	}
	@RequestMapping(value = { "theloai/{id}"})
	public ModelAndView Deltheloai(@PathVariable String id) {
		ModelAndView mv = new ModelAndView("admin/theloai");  	
		mv.addObject("theloai", id);
		mv.addObject("deltheloai", HomeServiceAdmin.DelTheloai(id)); 
		mv.addObject("theloai", HomeServiceAdmin.GetDataTheLoai());
		return mv;
	}
	
	@RequestMapping(value = { "capnhatten/{id}"})
	public ModelAndView UPTen(@PathVariable String id, HttpServletRequest rq) {
		ModelAndView mv = new ModelAndView("admin/theloai");  	 
		mv.addObject("theloai", HomeServiceAdmin.GetDataTheLoai());
		return mv;
	}
	@RequestMapping(value = { "theloai"})
	public ModelAndView Theloai() {
		ModelAndView mv = new ModelAndView("admin/theloai");
		mv.addObject("theloai", HomeServiceAdmin.GetDataTheLoai());
		return mv;
	}
	@RequestMapping(value = { "donhang"})
	public ModelAndView DonHang() {
		ModelAndView mv = new ModelAndView("admin/donhang");
		mv.addObject("hoadon", HomeServiceAdmin.GetDataHoaDon());
		return mv;
	}
	@RequestMapping(value = { "donhang/{id}"})
	public ModelAndView DanhsachDonHang(@PathVariable String id) {
		ModelAndView mv = new ModelAndView("admin/donhang");
		mv.addObject("hoadon", HomeServiceAdmin.GetDataDanhSachHD(id));
		return mv;
	}
	@RequestMapping(value = { "/chitietdonhang/{id}"})
	public ModelAndView ChiTietDonHang(@PathVariable String id) {
		ModelAndView mv = new ModelAndView("admin/chitietdonhang");
		mv.addObject("idchitiethd", id);
		mv.addObject("cthoadon", HomeServiceAdmin.GetDataHDbyId(id));
		return mv;
	}
	@RequestMapping(value = { "/xacnhandh/{id}"})
	public ModelAndView XacNhanDonHang(@PathVariable String id) {
		ModelAndView mv = new ModelAndView("admin/donhang");
		mv.addObject("idxacnhadh", id);
		mv.addObject("xacnhadh", HomeServiceAdmin.XacNhanHoaDon(id));
		mv.addObject("hoadon", HomeServiceAdmin.GetDataHoaDon());
		return mv;
	}
	@RequestMapping(value = { "/huydh/{id}"})
	public ModelAndView HuyDonHang(@PathVariable String id) {
		ModelAndView mv = new ModelAndView("admin/donhang");
		mv.addObject("idhuydh", id);
		mv.addObject("huydh", HomeServiceAdmin.HuyHoaDon(id));
		mv.addObject("hoadon", HomeServiceAdmin.GetDataHoaDon());
		return mv;
	}
	@RequestMapping(value = { "users"})
	public ModelAndView Users() {
		ModelAndView mv = new ModelAndView("admin/users");
		mv.addObject("users1", HomeServiceAdmin.GetDataUser());
		return mv;
	}
	@RequestMapping(value = { "/thaydoiquyen/{id}"})
	public ModelAndView ThayQuyen(@PathVariable String id) {
		ModelAndView mv = new ModelAndView("admin/users");
		mv.addObject("iduser", id);
		mv.addObject("themquyen", HomeServiceAdmin.ThemQuyenUser(id));
		mv.addObject("users1", HomeServiceAdmin.GetDataUser());
		return mv;
	}
	
	@RequestMapping(value = { "/huyquyen/{id}"})
	public ModelAndView HuyQuyen(@PathVariable String id) {
		ModelAndView mv = new ModelAndView("admin/users");
		mv.addObject("iduser", id);
		mv.addObject("huyquyen", HomeServiceAdmin.HuyQuyenUser(id));
		mv.addObject("users1", HomeServiceAdmin.GetDataUser());
		return mv;
	}
	
	@RequestMapping(value = { "/xoausers/{id}"})
	public ModelAndView XoaUsers(@PathVariable String id) {
		ModelAndView mv = new ModelAndView("admin/users");
		mv.addObject("iduser", id);
		mv.addObject("huyquyen", HomeServiceAdmin.DelUser(id));
		mv.addObject("users1", HomeServiceAdmin.GetDataUser());
		return mv;
	}
	
	@RequestMapping(value = "themsanpham", method = RequestMethod.GET)
	public ModelAndView addBook1() {
		ModelAndView mv = new ModelAndView("admin/themsanpham");
		mv.addObject("theloai1", HomeServiceAdmin.GetDataTheLoai());
		mv.addObject("addbooks", new AddBookAdmin());
		return mv;
	}
	
	@RequestMapping(value = "themsanpham", method = RequestMethod.POST)
	public ModelAndView createBook(HttpServletRequest request, @ModelAttribute("addbook") AddBookAdmin addbook) {
		ModelAndView mv = new ModelAndView("admin/themsanpham");
		
		if(addbook.getDongia() > 0) {
			if(addbook.getSoluong() > 0){
				int  count = HomeServiceAdmin.AddBooks(addbook);
				if(count > 0) {
					mv.addObject("status1", "Them sach thanh cong!!!");
				}else {
					mv.addObject("status1", "gia tri khong hop le");
					mv = new ModelAndView("admin/thatbai");
					return mv;
				}
				mv.setViewName("redirect:" +request.getHeader("Referer"));	
				mv.addObject("status1", true);
			}else {
				mv.addObject("status1", "gia tri khong hop le");
				mv = new ModelAndView("admin/thatbai");
				return mv;
			}
		}else {
			mv.addObject("status1", "gia tri khong hop le");
			mv = new ModelAndView("admin/thatbai");
			return mv;
		}
		return mv;
	}
	
	//
	@RequestMapping(value = "chinhsua", method = RequestMethod.GET)
	public ModelAndView Chinhsua() {
		ModelAndView mv = new ModelAndView("admin/chinhsua");
		mv.addObject("books", HomeService.GetDataBook());
		mv.addObject("theloai1", HomeServiceAdmin.GetDataTheLoai());
		mv.addObject("upbook", new UpBookAdmin());
		return mv;
	}

	@RequestMapping(value = "chinhsua", method = RequestMethod.POST)
	public ModelAndView UPBook(HttpServletRequest request, @ModelAttribute("updatebook") UpBookAdmin upbook) {
		ModelAndView mv = new ModelAndView("admin/chinhsua");
		
		if(upbook.getDongia() > 0) {
			if(upbook.getSoluong() > 0){
				int  count = HomeServiceAdmin.UpdateBook(upbook);
				if(count > 0) {
					mv.addObject("status1", "Them sach thanh cong!!!");
				}else {
					mv.addObject("status1", "gia tri khong hop le");
					mv = new ModelAndView("admin/thatbai");
					return mv;
				}
				mv.setViewName("redirect:" +request.getHeader("Referer"));	
				mv.addObject("status1", true);
			}else {
				mv.addObject("status1", "gia tri khong hop le");
				mv = new ModelAndView("admin/thatbai");
				return mv;
			}
		}else {
			mv.addObject("status1", "gia tri khong hop le");
			mv = new ModelAndView("admin/thatbai");
			return mv;
		}
		return mv;
	}
	
	//
	@RequestMapping(value = "themtheloai", method = RequestMethod.GET)
	public ModelAndView AddTheloai() {
		ModelAndView mv = new ModelAndView("admin/themtheloai");
		mv.addObject("theloai1", HomeServiceAdmin.GetDataTheLoai());
		mv.addObject("addtheloai", new TheLoaiAdmin());
		return mv;
	}

	@RequestMapping(value = "themtheloai", method = RequestMethod.POST)
	public ModelAndView CreateTheloai(HttpServletRequest request, @ModelAttribute("addloai") TheLoaiAdmin addtheloai) {
		ModelAndView mv = new ModelAndView("admin/themtheloai");
		if(!addtheloai.getTheloai().isEmpty()){
			int  count = HomeServiceAdmin.AddTheLoai(addtheloai);
			if(count >0) {
				mv.addObject("status1", "Them the loai thanh cong!!!");
			}else {
				mv.addObject("status1", "Them the loai that bai!!!");
				mv = new ModelAndView("admin/thatbai");
				return mv;
			}
			
		}else {
			mv.setViewName("redirect:" +request.getHeader("Referer"));
			mv.addObject("status1", "Them the loai that bai!!!");
			mv = new ModelAndView("admin/thatbai");
			return mv;
		}
		return mv;
	}
	
	@RequestMapping(value = "uptheloai", method = RequestMethod.GET)
	public ModelAndView UpdateTheloai() {
		ModelAndView mv = new ModelAndView("admin/uptheloai");
		mv.addObject("theloai1", HomeServiceAdmin.GetDataTheLoai());
		mv.addObject("updatetheloai", new TheLoaiAdmin());
		return mv;
	}

	@RequestMapping(value = "uptheloai", method = RequestMethod.POST)
	public ModelAndView UpTheloai(HttpServletRequest request, @ModelAttribute("uploai") TheLoaiAdmin uptheloai) {
		ModelAndView mv = new ModelAndView("admin/uptheloai");
		if(!uptheloai.getTheloai().isEmpty()){
			int  count = HomeServiceAdmin.UpTheLoai(uptheloai);
			if(count >0) {
				mv.addObject("status1", "Them the loai thanh cong!!!");
			}else {
				mv.addObject("status1", "Them the loai that bai!!!");
				mv = new ModelAndView("admin/thatbai");
				return mv;
			}
			
		}else {
			mv.setViewName("redirect:" +request.getHeader("Referer"));
			mv.addObject("status1", "Them the loai that bai!!!");
			mv = new ModelAndView("admin/thatbai");
			return mv;
		}
		return mv;
	}
	@RequestMapping(value = { "lienhe"})
	public ModelAndView Lienhekh() {
		ModelAndView mv = new ModelAndView("admin/lienhe");
		mv.addObject("lienhe", HomeServiceAdmin.GetDataLienhe());
		return mv;
	}
	
	@RequestMapping(value = { "danhgia"})
	public ModelAndView Danhgiabook() {
		ModelAndView mv = new ModelAndView("admin/danhgia");
		mv.addObject("danhgia", danhgiaService.GetDataDanhgia());
		return mv;
	}
	
	@RequestMapping(value = { "/xoadanhgia/{id}"})
	public ModelAndView Xoadanhgia(@PathVariable int id, HttpServletRequest rq) {
		ModelAndView mv = new ModelAndView("admin/danhgia");
		mv.addObject("danhgia", danhgiaService.GetDataDanhgia());
//		mv.addObject("xoadanhgiaid", danhgiaService.DelBook(id));
		danhgiaService.DelBook(id);
		mv.setViewName("redirect:"+rq.getHeader("Referer"));
//		mv.setViewName("redirect:admin/danhgia");
		return mv; 
	}
}

