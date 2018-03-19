package travel.common.utils;

import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class JsonUtils {
	
	public static JSONObject getJonStringFromMap(Map<String, Object> map){
		
		JSONObject json = new JSONObject();
		for(Map.Entry<String, Object> entry : map.entrySet()){
			json.put(entry.getKey(), entry.getValue());
		}
		return json;
	}

	public static JSONArray getJsonArrayFromList(List<Map<String,Object>> list){
		
		JSONArray jsonArray = new JSONArray();
		for(Map<String, Object> map : list){
			jsonArray.add(getJonStringFromMap(map));
		}
		return jsonArray;
	}
}
