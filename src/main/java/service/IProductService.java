package service;

import java.util.List;

import Model.ProductModel;

public interface IProductService {
	List<ProductModel> getAll();
	List<ProductModel> getAllproduct();
	List<ProductModel> findByName(String nameProduct, int indexPage);
	List<ProductModel> findbyCategory(String nameCategory);
	ProductModel findById(int IDProduct);
	ProductModel findByName(String nameProduct);
	int getSizeAll();
	int countByCategory(String nameCategory);
	int countByName(String nameProduct);
	List<ProductModel> pagingProduct(int index);
	void updateProduct(int id, String name, int quantity, float price, String describe, String image);
}
