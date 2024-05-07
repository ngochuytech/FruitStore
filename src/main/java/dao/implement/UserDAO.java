package dao.implement;

import Model.UserModel;
import dao.IUserDAO;

public class UserDAO extends AbstractDAO<UserModel> implements IUserDAO{

	@Override
	public void updateInformation(int id, String name, String Phone, String Address, String Email) {
		String sql = "Update [User]\r\n"
				+ "set userName = ?, Number = ?, [Address] = ?, Email = ? \r\n"
				+ "where ID = ?";
		update(sql, name, Phone, Address, Email, id);
	}
	
}
