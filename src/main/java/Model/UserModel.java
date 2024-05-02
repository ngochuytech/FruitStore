package Model;

public class UserModel {
	private int userId;
	private String uName;
	private String sdt;
	private String address;
	private String email;
	private RoleModel rolemodel;
	
	public UserModel() {
		super();
	}

	public UserModel(int userId, String uName, String sdt, String address, String email, RoleModel rolemodel) {
		super();
		this.userId = userId;
		this.uName = uName;
		this.sdt = sdt;
		this.address = address;
		this.email = email;
		this.rolemodel = rolemodel;
	}
	
	public int getUserId() {
		return userId;
	}
	
	public void setUserId(int userId) {
		this.userId = userId;
	}
	


	public String getuName() {
		return uName;
	}
	
	public void setuName(String uName) {
		this.uName = uName;
	}
	
	public String getSdt() {
		return sdt;
	}
	
	public void setSdt(String sdt) {
		this.sdt = sdt;
	}
	
	public String getAddress() {
		return address;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public RoleModel getRolemodel() {
		return rolemodel;
	}
	
	public void setRolemodel(RoleModel rolemodel) {
		this.rolemodel = rolemodel;
	}
	
	
}
