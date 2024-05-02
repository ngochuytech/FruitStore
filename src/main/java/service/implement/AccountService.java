package service.implement;

import javax.inject.Inject;

import Model.AccountModel;
import dao.IAccountDAO;
import service.IAccountService;

public class AccountService implements IAccountService{
	@Inject
	private IAccountDAO accountDAO;
	
	@Override
	public AccountModel findByUsernameAndPassword(String username, String password) {
		return accountDAO.findByUsernameAndPassword(username, password);
	}

	@Override
	public AccountModel findByUsername(String username) {
		return accountDAO.findByUsername(username);
	}

	@Override
	public int insert(AccountModel accountModel) {
		return accountDAO.insert(accountModel);
	}

}
