package service;

import Model.AccountModel;

public interface IAccountService {
	AccountModel findByUsernameAndPassword(String username,String password);
	AccountModel findByUsername(String username);
	
	int insert(AccountModel accountModel, int idUser);
}
