package travel.common.Api;

import java.io.BufferedInputStream;
import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class apiCommon {
	Logger log = Logger.getLogger(this.getClass());
	/**
	 * @param XML Parsing 주소 데이터 출력
	 * @return
	 */
	public List<Map<String, Object>> getXmlParsing(String paramUrl){
		
		List<Map<String, Object>> resultList = new ArrayList<Map<String,Object>>();
		Map<String, Object> resultMap = null;
		
		try {
			URL url = new URL(paramUrl);
			URLConnection connection = url.openConnection();
			
			Document doc = parseXML(connection.getInputStream());
			NodeList descNodes = doc.getElementsByTagName("item");
			
			log.info("######### 목록조회 시작 #########");
			for(int i=0; i<descNodes.getLength(); i++){
				resultMap = new HashMap<String, Object>();
				for(Node node = descNodes.item(i).getFirstChild(); node!=null; node=node.getNextSibling()){
					resultMap.put(node.getNodeName(), node.getTextContent());
				}
				log.info("resultMap:"+resultMap);
				resultList.add(resultMap);
			}
			log.info("######### 목록조회 종료#########");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultList;
	}
	
	public Document parseXML(InputStream stream){
		
		DocumentBuilderFactory objDocumentBuilderFactory = null;
		DocumentBuilder objDocumentBuilder = null;
		org.w3c.dom.Document doc = null;
		
		try {
			objDocumentBuilderFactory = DocumentBuilderFactory.newInstance();
			objDocumentBuilder = objDocumentBuilderFactory.newDocumentBuilder();
			
			doc = objDocumentBuilder.parse(stream);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return doc;
	}

	/**
	 * @param paramUrl : API 호출주소
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> getJsonParsing(String paramUrl){
		
		List<Map<String, Object>> resultList = new ArrayList<Map<String,Object>>();
		Map<String, Object> resultMap = null;
		
		try {
			JSONParser jsonparser = new JSONParser();
	        JSONObject jsonobject = (JSONObject)jsonparser.parse(readUrlData(paramUrl));
	        JSONObject json =  (JSONObject) jsonobject.get("response");
	        JSONObject json1 =  (JSONObject) json.get("body");
	        JSONObject json2 =  (JSONObject) json1.get("items");
	        JSONArray array = (JSONArray)json2.get("item");
	        
	        log.info("######### 목록조회 시작 #########");
	        for(int i=0; i<array.size(); i++){
	        	JSONObject tmp = (JSONObject)array.get(i);
	        	resultMap = new HashMap<String, Object>();
	        	Iterator<String> iterator = tmp.keySet().iterator();
	        	while(iterator.hasNext()){
	        		String key = (String)iterator.next();
	        		resultMap.put(key, tmp.get(key));
	        	}
	        	log.info("resultMap:"+resultMap);
	        	resultList.add(resultMap);
	        	
	        }
	        log.info("######### 목록조회 종료#########");

		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultList;
	}
	
	/**
	 * @param paramUrl : API 호출주소
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public JSONArray getJson(String paramUrl){
		
		JSONArray array = null;
		JSONObject json1 = null;
		JSONObject json2 = null;
		
		try {
			JSONParser jsonparser = new JSONParser();
	        JSONObject jsonobject = (JSONObject)jsonparser.parse(readUrlData(paramUrl));
	        JSONObject json =  (JSONObject) jsonobject.get("response");
	        array =  (JSONArray) json.get("body");
/*	        json2 =  (JSONObject) json1.get("items");
	        array = (JSONArray)json2.get("item");*/
	        
	        log.info("######### 목록조회 시작 #########");
	        log.info("json:"+json);
	        log.info("json1:"+json1);
	        log.info("array:"+array);
	        log.info("######### 목록조회 종료#########");

		} catch (Exception e) {
			e.printStackTrace();
		}
		return array;
	}	
	
	
	/**
	 * @param getUrl : API 호출주소
	 * @return
	 * @throws Exception
	 */
	public String readUrlData(String getUrl) throws Exception {
		
        BufferedInputStream reader = null;
        try {
            URL url = new URL(getUrl);
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
}
