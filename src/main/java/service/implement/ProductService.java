package service.implement;

import java.util.List;

import javax.inject.Inject;

import Model.ProductModel;
import dao.IProductDAO;
import service.IProductService;

public class ProductService implements IProductService{
	@Inject
	private IProductDAO productDAO;

	@Override
	public List<ProductModel> getAll() {
		return productDAO.getAll();
	}

	@Override
	public List<ProductModel> findByName(String nameProduct, int indexPage) {
		return productDAO.findByName(nameProduct, indexPage);
	}

	@Override
	public List<ProductModel> findbyCategory(String nameCategory) {
		return productDAO.findbyCategory(nameCategory);
	}

	@Override
	public int getSizeAll() {
		return productDAO.getSizeAll();
	}

	@Override
	public List<ProductModel> pagingProduct(int index) {
		return productDAO.pagingProduct(index);
	}

	@Override
	public int countByCategory(String nameCategory) {
		return productDAO.countByCategory(nameCategory);
	}

	@Override
	public int countByName(String nameProduct) {
		return productDAO.countByName(nameProduct);
	}

	@Override
	public ProductModel findByName(String nameProduct) {
		return productDAO.findByName(nameProduct);
	}

	@Override
	public ProductModel findById(int IDProduct) {
		return productDAO.findById(IDProduct);
	}

	@Override
	public List<ProductModel> getAllproduct() {
		return productDAO.getAllproduct();
	}

	@Override
	public void updateProduct(int id, String name, int idCategory, float price, String describe, String image) {
		productDAO.updateProduct(id, name, idCategory, price, describe, image);
	}

	@Override
	public int insertProduct(String name, int idCategory, float price, String describe, String image) {
		return productDAO.insertProduct(name, idCategory, price, describe, image);
	}

	@Override
	public List<ProductModel> findbyname(String nameProduct) {
		return productDAO.findbyname(nameProduct);
	}
	
}
