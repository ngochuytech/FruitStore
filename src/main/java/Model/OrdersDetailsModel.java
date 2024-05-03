package Model;

import java.io.Serializable;

public class OrdersDetailsModel implements Serializable{
	private int id;
	private ProductModel product;
	private int quantity;
	private float price;
	private int order;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	public int getQuantity() {
		return quantity;
	}
	
	public ProductModel getProduct() {
		return product;
	}
	public void setProduct(ProductModel product) {
		this.product = product;
	}
	
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public int getOrders() {
		return order;
	}
	public void setOrders(int orders) {
		this.order = orders;
	}

}
