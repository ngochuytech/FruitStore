package mapper.implement;

import java.sql.ResultSet;
import java.sql.SQLException;

import Model.AccountModel;
import Model.UserModel;
import mapper.RowMapper;

public class AccountMapper implements RowMapper<AccountModel>{

	@Override
	public AccountModel mapRow(ResultSet rs) {
		try {
			AccountModel accountModel = new AccountModel();
			accountModel.setId(rs.getInt("ID"));
			accountModel.setUsername(rs.getString("AccountName"));
			accountModel.setPassword(rs.getString("password"));
			UserModel userModel = new UserMapper().mapRow(rs);
			accountModel.setUser(userModel);
			return accountModel;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
}
