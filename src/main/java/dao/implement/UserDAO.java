package dao.implement;

import Model.UserModel;
import dao.IUserDAO;

public class UserDAO extends AbstractDAO<UserModel> implements IUserDAO{

	@Override
	public void updateInformation(int id, String name, String Phone, String Address, String Email) {
		String sql = "Update [User]\r\n"
				+ "set userName = ?, Number = ?, [Address] = ?, Email = ? \r\n"
				+ "where IDuser = ?";
		update(sql, name, Phone, Address, Email, id);
	}

	@Override
	public int insert(String name, String email) {
		String sql = "insert into [User](userName,Email,roleId)\r\n"
				+ "values(?,?,2)";
		return insert(sql, name, email);
	}
	
}
