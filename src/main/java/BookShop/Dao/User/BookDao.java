package BookShop.Dao.User;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import BookShop.Entity.User.Books;
import BookShop.Entity.User.MapperBooks;

@Repository
public class BookDao {
	@Autowired
	public JdbcTemplate _jdbcTemplate;
	
	private StringBuffer SqlString() {
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT ");
		sql.append("b.idbook");
//		sql.append(", b.idtg ");
		sql.append(", b.idkm ");
//		sql.append(", b.idnxb ");
		sql.append(", b.idloai ");
		sql.append(", b.tensach ");
		sql.append(", b.tacgia ");
		sql.append(", b.tennxb ");
		sql.append(", b.gioithieu ");
		sql.append(", b.soluong ");
		sql.append(", b.dongia ");
		sql.append(", b.hinhanh ");
		sql.append(", t.idloai ");
		sql.append(", t.tenloai ");
		sql.append("FROM ");
		sql.append("book AS b ");
		sql.append("INNER JOIN ");
		sql.append("theloai AS t ");
		sql.append("ON b.idloai = t.idloai ");
		return sql;
	}
	
	private StringBuffer SqlProductsByID(int id) {
		StringBuffer sql = SqlString();
		sql.append("WHERE 1 = 1 ");
		sql.append("AND t.idloai = " + id + " ");
		return sql;
	}
	
	private StringBuffer SqlProductsAllProduct_Theloai() {
		StringBuffer sql = SqlString();
		sql.append("WHERE 1 = 1 ");
		return sql;
	}
	
	public List<Books> GetDataBookAllProduct_Theloai(){
		String sql = SqlProductsAllProduct_Theloai().toString();
		List<Books> list = new ArrayList<Books>();
		list = _jdbcTemplate.query(sql, new MapperBooks());
		return list;
	}
	
//	Lấy vị trí bắt đầu và kết thúc, như số lượng cần lấy
//	private String SqlProductsPaginate(int id, int start, int totalPage) {
//		StringBuffer sql = SqlProductsByID(id);
//		sql.append("LIMIT " + start + ", "+ totalPage);
//		return sql.toString();
//	}
	
//	public List<Books> GetDataProductsPaginate(int id, int start, int totalPage) {
//		StringBuffer sqlGetDataByID = SqlProductsByID(id);
//		List<Books> listProductsByID = _jdbcTemplate.query(sqlGetDataByID.toString(), new MapperBooks());
//		List<Books> listProducts = new ArrayList<ProductsDto>();
//		if(listProductsByID.size() > 0) {
//			String sql = SqlProductsPaginate(id, start, totalPage);
//			listProducts = _jdbcTemplate.query(sql, new ProductsDtoMapper());
//		}
//		return listProducts;
//	}
	
	public List<Books> GetDataBook(){
		String sql = SqlProductsByID(1).toString();
		List<Books> list = new ArrayList<Books>();
		list = _jdbcTemplate.query(sql, new MapperBooks());
		return list;
	}
	
	
	private String SqlProductByID(long id) {
		StringBuffer sql = SqlString();
		sql.append("WHERE 1 = 1 ");
		sql.append("AND b.idbook = " + id + " ");
//		sql.append("LIMIT 1 ");
		return sql.toString();
	}
	
	public List<Books> GetProductByID(int id) {
		String sql = SqlProductByID(id);
		List<Books> listProduct = _jdbcTemplate.query(sql, new MapperBooks());
		return listProduct;
	}
	
	private String SqlProductsByLoai(int id) {
		StringBuffer sql = SqlString();
		sql.append("WHERE 1 = 1 ");
		sql.append("AND t.idloai = " + id + " ");
		return sql.toString();
	}
	
	public List<Books> GetProductsByLoai(int id) {
		String sql = SqlProductsByLoai(id);
		List<Books> listProduct = _jdbcTemplate.query(sql, new MapperBooks());
		return listProduct;
	}
	
	public Books FindProductByID(long id) {
		String sql = SqlProductByID(id);
		Books product = _jdbcTemplate.queryForObject(sql, new MapperBooks());
		return product;
	}
	
	private String SqlProductIndexByID() {
		StringBuffer sql = SqlString();
		sql.append(" ORDER BY rand() LIMIT 9");
		return sql.toString();
		
	}
	
	public List<Books> GetProductIndexByID() {
		String sql = SqlProductIndexByID();
		List<Books> listProduct = _jdbcTemplate.query(sql, new MapperBooks());
		return listProduct;
	}
	
	private String SqlNewProducts() {
		StringBuffer sql = SqlString();
		sql.append(" ORDER BY b.idbook DESC LIMIT 8");
		return sql.toString();
		
	}
	
	public List<Books> GetNewProducts() {
		String sql = SqlNewProducts();
		List<Books> listProduct = _jdbcTemplate.query(sql, new MapperBooks());
		return listProduct;
	}
	
	private String SqlRandProduct() {
		StringBuffer sql = SqlString();
		sql.append(" ORDER BY rand() LIMIT 4");
		return sql.toString();
		
	}
	
	public List<Books> GetRandProduct() {
		String sql = SqlRandProduct();
		List<Books> listProduct = _jdbcTemplate.query(sql, new MapperBooks());
		return listProduct;
	}
	
	private String SqlRandProduct2() {
		StringBuffer sql = SqlString();
		sql.append(" ORDER BY rand() LIMIT 4");
		return sql.toString();
		
	}
	
	public List<Books> GetRandProduct2() {
		String sql = SqlRandProduct2();
		List<Books> listProduct = _jdbcTemplate.query(sql, new MapperBooks());
		return listProduct;
	}
	
	private String SqlRandProduct3() {
		StringBuffer sql = SqlString();
		sql.append(" ORDER BY rand() LIMIT 4");
		return sql.toString();
		
	}
	
	public List<Books> GetRandProduct3() {
		String sql = SqlRandProduct3();
		List<Books> listProduct = _jdbcTemplate.query(sql, new MapperBooks());
		return listProduct;
	}
	
}
