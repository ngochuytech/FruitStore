package service;

public interface IUserService {
	int insert(String name, String email);
	void updateInformation(int id, String name, String Phone, String Address, String Email);
}
