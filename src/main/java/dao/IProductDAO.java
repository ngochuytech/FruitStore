package dao;

import java.util.List;

import Model.ProductModel;

public interface IProductDAO {
	List<ProductModel> getAll();
	List<ProductModel> getAllproduct();
	int getQuantity(int id);
	List<ProductModel> findByName(String nameProduct, int indexPage);
	List<ProductModel> findbyCategory(String nameCategory);
	ProductModel findById(int IDProduct);
	ProductModel findByName(String nameProduct);
	List<ProductModel> findbyname(String nameProduct);
	int getSizeAll();
	int countByCategory(String nameCategory);
	int countByName(String nameProduct);
	List<ProductModel> pagingProduct(int index);
	void updateProduct(int id, String name, int quantity, int idCategory, float price, String describe, String image);
	int insertProduct(String name, int quantity, int idCategory, float price, String describe, String image);
}
