package Model;

import java.util.List;

public class OrdersModel {
	private int id;
	private String date_Create;
	private String date_Confirm;
	private UserModel userModel;
	private String address;
	private float total_Price;
	private String status;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDate_Create() {
		return date_Create;
	}
	public void setDate_Create(String date_Create) {
		this.date_Create = date_Create;
	}

	public UserModel getUserModel() {
		return userModel;
	}
	public void setUserModel(UserModel userModel) {
		this.userModel = userModel;
	}
	public float getTotal_Price() {
		return total_Price;
	}
	public void setTotal_Price(float total_Price) {
		this.total_Price = total_Price;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getDate_Confirm() {
		return date_Confirm;
	}
	public void setDate_Confirm(String date_Confirm) {
		this.date_Confirm = date_Confirm;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
}
