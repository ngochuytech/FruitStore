package service.implement;

import java.util.List;

import javax.inject.Inject;

import Model.CategoryModel;
import dao.ICategoryDAO;
import service.ICategoryService;

public class CategoryService implements ICategoryService{

	@Inject
	private ICategoryDAO categoryDAO;
	
	@Override
	public List<CategoryModel> getAll() {
		return categoryDAO.getAll();
	}

}
