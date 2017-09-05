import java.util.List;

public class RestaurantModel {
	
	private String name;
	public int price;
	private int type;
	private List<String> cusines;

	public RestaurantModel(String name, int price, int type,
			List<String> cusines){	
		setName(name);
		setPrice(price);
		setType(type);
		setCusines(cusines);
	}
	
	public String getName(){
		return this.name;
	}
	
	public void setName(String name){
		this.name = name;
	}
	
	public int getPrice(){
		return this.price;
	}
	
	public void setPrice(int price){
		this.price = price;
	}
	
	public int getType(){
		return this.type;
	}
	
	public void setType(int type){
		this.type = type;
	}
	
	public List<String> getCusines(){
		return this.cusines;
	}
	
	public void setCusines(List<String> cusines){
		this.cusines = cusines;
	}
}
