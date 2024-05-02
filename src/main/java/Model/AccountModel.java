package Model;

public class AccountModel {
	private int id;
	private String username;
	private String password;
	private UserModel userModel;

	public AccountModel(int id, String username, String password, UserModel userModel) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.userModel = userModel;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public AccountModel() {
		super();
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public UserModel getUser() {
		return userModel;
	}
	public void setUser(UserModel user) {
		this.userModel = user;
	}
	
	
}
