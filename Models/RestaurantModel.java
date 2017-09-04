import java.util.List;

public class RestaurantModel {
	
	private String name;
	public String price;
	private String type;
	private List<String> cusines;

	public RestaurantModel(String name, String price, String type,
			List<String> cusines){	
		name = getName();
		price = getPrice();
		type = getType();
		cusines = getCusines();
	}
	
	public String getName(){
		return this.name;
	}
	
	public void setName(String name){
		this.name = name;
	}
	
	public String getPrice(){
		return this.price;
	}
	
	public void setPrice(String price){
		this.price = price;
	}
	
	public String getType(){
		return this.type;
	}
	
	public void setType(String type){
		this.price = type;
	}
	
	public List<String> getCusines(){
		return this.cusines;
	}
	
	public void setCusines(List<String> cusines){
		this.cusines = cusines;
	}
}
