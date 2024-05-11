package dao;

import Model.AccountModel;

public interface IAccountDAO {
	AccountModel findByUsernameAndPassword(String username,String password);
	AccountModel findByUsername(String username);
	int insert(AccountModel accountModel, int idUser);
}
