package Model;

import java.util.List;

public class OrdersModel {
	private int id;
	private String date_Create;
	private UserModel userModel;
	private List<OrdersDetailsModel> item;
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
	public List<OrdersDetailsModel> getItem() {
		return item;
	}
	public void setItem(List<OrdersDetailsModel> item) {
		this.item = item;
	}
	
}
