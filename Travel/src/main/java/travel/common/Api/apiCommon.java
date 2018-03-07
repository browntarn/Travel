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

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import travel.common.controller.CommonController;

/**   
* @Title: apiCommon.java 
* @Package travel.common.Api 
* @Description: TODO(설명) 
* @author 김성우  
* @date 2018. 1. 31. 
* @version V1.0   
*/ 
public class apiCommon {
	private static final Logger LOGGER = LoggerFactory.getLogger(apiCommon.class);
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
			
			LOGGER.info("######### 목록조회 시작 #########");
			for(int i=0; i<descNodes.getLength(); i++){
				resultMap = new HashMap<String, Object>();
				for(Node node = descNodes.item(i).getFirstChild(); node!=null; node=node.getNextSibling()){
					resultMap.put(node.getNodeName(), node.getTextContent());
				}
				LOGGER.info("resultMap:"+resultMap);
				resultList.add(resultMap);
			}
			LOGGER.info("######### 목록조회 종료#########");
			
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
	        
	        LOGGER.info("######### 목록조회 시작 #########");
	        for(int i=0; i<array.size(); i++){
	        	JSONObject tmp = (JSONObject)array.get(i);
	        	resultMap = new HashMap<String, Object>();
	        	Iterator<String> iterator = tmp.keySet().iterator();
	        	while(iterator.hasNext()){
	        		String key = (String)iterator.next();
	        		resultMap.put(key, tmp.get(key));
	        	}
	        	LOGGER.info("resultMap:"+resultMap);
	        	resultList.add(resultMap);
	        	
	        }
	        LOGGER.info("######### 목록조회 종료#########");

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
	        
	        LOGGER.info("######### 목록조회 시작 #########");
	        LOGGER.info("json:"+json);
	        LOGGER.info("json1:"+json1);
	        LOGGER.info("array:"+array);
	        LOGGER.info("######### 목록조회 종료#########");

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
	
	/**
	 * @param param : Json 조회조건
	 * @param travelUrl : 여행정보 URL
	 * @param authenticationKey : api 인증키
	 * @return
	 * @throws Exception
	 */
	public String selectSchdule(String param, String travelUrl, String authenticationKey) throws Exception{
		
		JSONObject json = JSONObject.fromObject(param);
		
		StringBuffer addUrl = new StringBuffer();
		addUrl.append(authenticationKey);  //인증키번호
		//addUrl.append("&categoryCode="); //서비스 분류코드 조회
		//addUrl.append("&areaBasedList="); //지역기반 관광정보 조회
		//addUrl.append("&locationBasedList="); //위치기반 관광정보 조회		
		//addUrl.append("&searchKeyword="); //키워드 검색 조회
		//addUrl.append("&searchFestival="); //행사정보 조회
		//addUrl.append("&searchStay="); //숙박정보 조회
		addUrl.append("&areaCode="+(String) json.get("areaCode"));//지역번호 조회
		addUrl.append("&sigunguCode="+(String) json.get("sigunguCode")); //시구군
		addUrl.append("&arrange=A"); //목록구분 A=제목수, B=조회순, C=수정일순, D=생성일순
		addUrl.append("&listYN=Y"); //목록구분 Y=목록, N= 개수
		addUrl.append("&numOfRows=20"); //한페이지 결과수
		addUrl.append("&pageNo="+(String) json.get("page")); //한페이지 결과수
		addUrl.append("&MobileOS=ETC"); //OS 구분 IOS(아이폰), AND(안드로이드), WIN(윈도우폰), ETC
		addUrl.append("&MobileApp=TourAPI3.0_Guide"); //서비스명
		addUrl.append("&_type=json"); //JSON 타입
		//addUrl.append("&areaCode=&sigunguCode=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=12&pageNo=1");
		LOGGER.info("travelUrl+addUrl.toString():"+travelUrl+addUrl.toString());
		return readUrlData(travelUrl+addUrl.toString());
	}
	
	/**
	 * @param areaCodeUrl : 지역코드 URL
	 * @param authenticationKey : api 인증키
	 * @param areaCode : 지역코드없을경우 전체지역
	 *                   지역코드 있을경우 시군구 코드 불러오기
	 * @return
	 * @throws Exception
	 */
	public String commonAreaCode(String areaCodeUrl, String authenticationKey, String areaCode) throws Exception{
		StringBuffer addUrl = new StringBuffer();
		addUrl.append(authenticationKey); 
		addUrl.append("&areaCode="+areaCode);
		addUrl.append("&numOfRows=30");
		addUrl.append("&pageNo=1");
		addUrl.append("&MobileOS=ETC"); 
		addUrl.append("&MobileApp=TourAPI3.0_Guide"); 
		addUrl.append("&_type=json"); 
		LOGGER.info("travelUrl+addUrl.toString():"+areaCodeUrl+addUrl.toString());
		return readUrlData(areaCodeUrl+addUrl.toString());
	}
}
