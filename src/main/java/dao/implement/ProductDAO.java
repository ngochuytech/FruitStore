package dao.implement;

import java.util.List;

import Model.ProductModel;
import dao.IProductDAO;
import mapper.implement.ProductMapper;

public class ProductDAO extends AbstractDAO<ProductModel> implements IProductDAO{

	@Override
	public List<ProductModel> getAll() {
		String sql = "select * from Products as P inner join Category as C on P.ID_Category=C.ID";
		List<ProductModel> list = query(sql, new ProductMapper());
		return list;
	}

	@Override
	public List<ProductModel> findByName(String nameProduct, int indexPage) {
		String sql = "select * from Products\r\n"
				+ "inner join Category on Products.ID_Category=Category.ID\r\n"
				+ "where Products.[Name] like ? \r\n"
				+ "order by Products.ID\r\n"
				+ "offset ? rows fetch next 9 rows only";
		List<ProductModel> list = query(sql, new ProductMapper(),"%" + nameProduct + "%", (indexPage-1)*9);
		return list;
	}

	@Override
	public List<ProductModel> findbyCategory(String nameCategory) {
		String sql = "select * from Products as P\r\n"
				+ "inner join Category as C on P.ID_Category=C.ID\r\n"
				+ "where C.[CategoryName] = ?";
		List<ProductModel> list = query(sql, new ProductMapper(), nameCategory);
		return list;
	}

	@Override
	public int getSizeAll() {
		String sql = "select count(*) from Products\r\n"
				+ "inner join Category on Products.ID_Category=Category.ID";
		return  count(sql);
	}

	@Override
	public List<ProductModel> pagingProduct(int index) {
		String sql = "select * from Products\r\n"
				+ "inner join Category on Products.ID_Category=Category.ID\r\n"
				+ "order by Products.ID\r\n"
				+ "offset ? rows fetch next 9 rows only";
		List<ProductModel> list = query(sql,new ProductMapper(), (index-1)*9);
		return list;
	}

	@Override
	public int countByCategory(String nameCategory) {
		String sql = "select count(*) from Products\r\n"
				+ "inner join Category on Products.ID_Category=Category.ID\r\n"
				+ "where Category.CategoryName = ?";
		return  count(sql,nameCategory);
	}

	@Override
	public int countByName(String nameProduct) {
		String sql = "select count(*) from Products\r\n"
				+ "inner join Category on Products.ID_Category=Category.ID\r\n"
				+ "where Products.[Name] like ?";
		return count(sql,nameProduct);
	}

	@Override
	public ProductModel findByName(String nameProduct) {
		String sql = "select * from Products\r\n"
				+ "inner join Category on Products.ID_Category=Category.ID\r\n"
				+ "where Products.[Name] = ?";
		List<ProductModel> list = query(sql,new ProductMapper(), nameProduct);
		return list.isEmpty()?null:list.get(0);
	}

	@Override
	public ProductModel findById(int IDProduct) {
		String sql = "select * from Products\r\n"
				+ "inner join Category on Products.ID_Category=Category.ID\r\n"
				+ "where Products.ID = ?";
		List<ProductModel> list = query(sql,new ProductMapper(), IDProduct);
		return list.isEmpty()?null:list.get(0);
	}
	
//	public static void main(String[] args) {
//		ProductDAO dao = new ProductDAO();
//		System.out.println(dao.countByCategory("Trái cây"));
//		List<ProductModel> list = dao.pagingProduct(2);
//		for(ProductModel p : list)
//			System.out.println(p.getId() + p.getName());
//	}
}
