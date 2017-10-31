package wheelofhunger.models;

public class UserModel {
	
	private int userId;
	private int secQuestion1;
	private int secQuestion2;
	private int secQuestion3;
	private String secAnswer1;
	private String secAnswer2;
	private String secAnswer3;

	public UserModel(){
	}
	
	public int getUserId(){
		return this.userId;
	}
	
	public void setUserId(int id){
		userId = id;
	}
	
	public int getSecQuestion1(){
		return secQuestion1;
	}
	
	public void setSecQuestion1(int question1){
		secQuestion1 = question1;
	}
	
	public int getSecQuestion2(){
		return secQuestion2;
	}
	
	public void setSecQuestion2(int question2){
		secQuestion2 = question2;
	}
	
	public int getSecQuestion3(){
		return secQuestion3;
	}
	
	public void setSecQuestion3(int question3){
		secQuestion3 = question3;
	}
	
	public String getSecAnswer1(){
		return secAnswer1;
	}
	
	public void setSecAnswer1(String answer1){
		secAnswer1 = answer1;
	}
	
	public String getSecAnswer2(){
		return secAnswer2;
	}
	
	public void setSecAnswer2(String answer2){
		secAnswer2 = answer2;
	}
	
	public String getSecAnswer3(){
		return secAnswer3;
	}
	
	public void setSecAnswer3(String answer3){
		secAnswer3 = answer3;
	}
	
}
