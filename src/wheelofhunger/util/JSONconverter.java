package wheelofhunger.util;

import com.google.gson.Gson;

public class JSONconverter {

	private static Gson gson = new Gson();
	
	public static String convert(Object object){
		
		return gson.toJson(object);
	}
}
