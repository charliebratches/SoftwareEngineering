package wheelofhunger.models;
import java.util.List;

public class RestaurantModel {
	
	private String name;
	public int price;
	private int type;
	private List<String> cuisines;
	private List<String> notes;
	private int id;
	private int distance;

	public RestaurantModel(){
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
	
	public String convertToPrice(int price){
		String priceString="";
		
		switch(price){
			case 1:
				priceString ="$";
				break;
			case 2:
				priceString ="$$";
				break;
			case 3:
				priceString = "$$$";
				break;
			case 4:
				priceString = "$$$$";
				break;
			case 5:
				priceString = "$$$$$";
				break;
			default:
				priceString = Integer.toString(price);
				break;
		}		
		return priceString;
	}
	
	public int getType(){
		return this.type;
	}
	
	public void setType(int type){
		this.type = type;
	}
	
	public String convertToType(int type){
		String typeString="";
		
		switch(type){
			case 1:
				typeString ="Fast Food";
				break;
			case 2:
				typeString ="Sit-Down";
				break;
			case 3:
				typeString = "Dessert";
				break;
			case 4:
				typeString = "Bakery";
				break;
			case 5:
				typeString = "Cafe";
				break;
			default:
				typeString = Integer.toString(type);
				break;
		}		
		return typeString;
	}
	
	public List<String> getCuisines(){
		return this.cuisines;
	}
	
	public void setCuisines(List<String> cuisines){
		this.cuisines = cuisines;
	}
	
	public List<String> getNotes(){
		return this.notes;
	}
	
	public void setNotes(List<String> notes){
		this.notes = notes;
	}
	
	public int getId(){
		return this.id;
	}
	
	public void setId(int id){
		this.id = id;
	}
	
	public int getDistance(){
		return this.distance;
	}
	
	public void setDistance(int distance){
		this.distance = distance;
	}
	
	
}
