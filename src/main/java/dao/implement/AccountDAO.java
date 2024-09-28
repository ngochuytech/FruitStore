package dao.implement;
 
import java.util.List;

import Model.AccountModel;
import dao.IAccountDAO;
import mapper.implement.AccountMapper;

public class AccountDAO extends AbstractDAO<AccountModel> implements IAccountDAO{
	
	@Override
	public AccountModel findByUsernameAndPassword(String username, String password) {
		String sql = "Select * from Account as ac "
				+ "inner join [User] on ac.userId = [User].IDuser "
				+ "inner join [Role] on [User].roleId = [Role].roleId "
				+ "where ac.AccountName = ? and ac.[password] = ?";	
		List<AccountModel> accounts = query(sql, new AccountMapper(),username, password);
		return  accounts.isEmpty()? null : accounts.get(0);
	}

	@Override
	public AccountModel findByUsername(String username) {
		String sql = "select * from [Account] "
				+ "inner join [User] on [Account].userId=[User].IDuser "
				+ "inner join [Role] on [User].roleId = [Role].roleId "
				+ "where [Account].AccountName= ?";
		List<AccountModel> accounts = query(sql, new AccountMapper(),username);
		return  accounts.isEmpty()? null : accounts.get(0);
	}

	@Override
	public int insert(AccountModel accountModel, int idUser) {
		String sql = "Insert into [Account](AccountName,[password],userId) values (?,?,?)";
	    return insert(sql, accountModel.getUsername(), accountModel.getPassword(), idUser);
	}

}
