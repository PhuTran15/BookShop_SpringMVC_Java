//package BookShop.UserController;
//
//public class CartController {
//	@Autowired
//    private ProductService productService;
//
//    @RequestMapping(value = "add/{productId}.html", method = RequestMethod.GET)
//    public String viewAdd(ModelMap mm, HttpSession session, @PathVariable("productId") long productId) {
//        HashMap<Long, Cart> cartItems = (HashMap<Long, Cart>) session.getAttribute("myCartItems");
//        if (cartItems == null) {
//            cartItems = new HashMap<>();
//        }
//        Product product = productService.findById(productId);
//        if (product != null) {
//            if (cartItems.containsKey(productId)) {
//                Cart item = cartItems.get(productId);
//                item.setProduct(product);
//                item.setQuantity(item.getQuantity() + 1);
//                cartItems.put(productId, item);
//            } else {
//                Cart item = new Cart();
//                item.setProduct(product);
//                item.setQuantity(1);
//                cartItems.put(productId, item);
//            }
//        }
//        session.setAttribute("myCartItems", cartItems);
//        session.setAttribute("myCartTotal", totalPrice(cartItems));
//        session.setAttribute("myCartNum", cartItems.size());
//        return "pages/cart";
//    }
//
//    @RequestMapping(value = "sub/{productId}.html", method = RequestMethod.GET)
//    public String viewUpdate(ModelMap mm, HttpSession session, @PathVariable("productId") long productId) {
//        HashMap<Long, Cart> cartItems = (HashMap<Long, Cart>) session.getAttribute("myCartItems");
//        if (cartItems == null) {
//            cartItems = new HashMap<>();
//        }
//        session.setAttribute("myCartItems", cartItems);
//        return "pages/cart";
//    }
//
//    @RequestMapping(value = "remove/{productId}.html", method = RequestMethod.GET)
//    public String viewRemove(ModelMap mm, HttpSession session, @PathVariable("productId") long productId) {
//        HashMap<Long, Cart> cartItems = (HashMap<Long, Cart>) session.getAttribute("myCartItems");
//        if (cartItems == null) {
//            cartItems = new HashMap<>();
//        }
//        if (cartItems.containsKey(productId)) {
//            cartItems.remove(productId);
//        }
//        session.setAttribute("myCartItems", cartItems);
//        session.setAttribute("myCartTotal", totalPrice(cartItems));
//        session.setAttribute("myCartNum", cartItems.size());
//        return "pages/cart";
//    }
//
//    public double totalPrice(HashMap<Long, Cart> cartItems) {
//        int count = 0;
//        for (Map.Entry<Long, Cart> list : cartItems.entrySet()) {
//            count += list.getValue().getProduct().getProductPrice() * list.getValue().getQuantity();
//        }
//        return count;
//    }
//
//}
//}
