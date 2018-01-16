import java.io.BufferedInputStream;
import java.net.URL;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;


public class aa {
    
    public aa() throws Exception{
         
         JSONParser jsonparser = new JSONParser();
         JSONObject jsonobject = (JSONObject)jsonparser.parse(readUrl());
         JSONObject json =  (JSONObject) jsonobject.get("boxOfficeResult");
         JSONArray array = (JSONArray)json.get("dailyBoxOfficeList");
         for(int i = 0 ; i < array.size(); i++){
             
             JSONObject entity = (JSONObject)array.get(i);
             String movieNm = (String) entity.get("movieNm");
             System.out.println(movieNm);
         }
         
         
    }
    private static String readUrl() throws Exception {
        BufferedInputStream reader = null;
        try {
            URL url = new URL(
                    "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchFestival?ServiceKey=4lBgY9cDqJIpN1Z8iUbivpOCw0Gpz9wv89knT5YvKw0%2Fez7p%2FnHffV0EHiD6tGFirL6fw%2BQV20F1wM9KdokJxg%3D%3D&areaCode=&sigunguCode=&arrange=A&listYN=Y&numOfRows=20&pageNo=1&MobileOS=ETC&MobileApp=TourAPI3.0_Guide");
            reader = new BufferedInputStream(url.openStream());
            StringBuffer buffer = new StringBuffer();
            int i;
            byte[] b = new byte[4096];
            while( (i = reader.read(b)) != -1){
              buffer.append(new String(b, 0, i));
            }
            return buffer.toString();
        } finally {
            if (reader != null)
                reader.close();
        }
    }
 
    
    public static void main(String[] args) {
        // TODO Auto-generated method stub
        try {
            new aa();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
 
}
