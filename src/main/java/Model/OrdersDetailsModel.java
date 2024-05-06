package Model;

import java.io.Serializable;

public class OrdersDetailsModel implements Serializable{
	private int id;
	private ProductModel product;
	private int quantity;
	private float price;
	private int order;
	private int id_product;
	public int getOrder() {
		return order;
	}
	public void setOrder(int order) {
		this.order = order;
	}
	public int getId_product() {
		return id_product;
	}
	public void setId_product(int id_product) {
		this.id_product = id_product;
	}
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
