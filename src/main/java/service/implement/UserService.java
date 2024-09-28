package service.implement;

import javax.inject.Inject;

import dao.IUserDAO;
import service.IUserService;

public class UserService implements IUserService{

	@Inject
	private IUserDAO userDAO;
	@Override
	public void updateInformation(int id, String name, String Phone, String Address, String Email) {
		userDAO.updateInformation(id, name, Phone, Address, Email);
	}
	@Override
	public int insert(String name, String email) {
		return userDAO.insert(name, email);
	}

}
