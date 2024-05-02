package dao;

import java.util.List;

import Model.ProductModel;

public interface IProductDAO {
	List<ProductModel> getAll();
	List<ProductModel> findByName(String nameProduct, int indexPage);
	List<ProductModel> findbyCategory(String nameCategory);
	ProductModel findById(int IDProduct);
	ProductModel findByName(String nameProduct);
	int getSizeAll();
	int countByCategory(String nameCategory);
	int countByName(String nameProduct);
	List<ProductModel> pagingProduct(int index);
}
