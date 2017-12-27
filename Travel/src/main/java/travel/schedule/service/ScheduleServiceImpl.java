package travel.schedule.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;


@Service("scheduleService")
public class ScheduleServiceImpl extends EgovAbstractServiceImpl implements ScheduleService {

	private static final Logger LOGGER = LoggerFactory.getLogger(ScheduleServiceImpl.class);

	@SuppressWarnings("rawtypes")
	@Override
	public List getScheduleList(Map<String, Object> commandMap) throws Exception {
		String url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchFestival?serviceKey=JZluWzN7N9c08lN8Xa4k4MEWUbNY0aC%2B0UNowlQfK9d0hzoPZQFpLg7KRSnmaACu47KhBTl48XXGOVWap8AWrQ%3D%3D&MobileOS=ETC&MobileApp=AppTest&arrange=A&listYN=Y&eventStartDate=20170901";
		
		String areaCode = "1";
		if (commandMap.get("areaSelectList") != null && commandMap.get("areaSelectList") != "") {
			areaCode = (String) commandMap.get("areaSelectList");
		}
		
		String eventStartDate = "20171111";
		if (commandMap.get("eventStartDate") != null && commandMap.get("eventStartDate") != "") {
			eventStartDate = (String) commandMap.get("eventStartDate");
		}
		String eventEndDate = "20171130";
		if (commandMap.get("eventEndDate") != null && commandMap.get("eventEndDate") != "") {
			eventEndDate = (String) commandMap.get("eventEndDate");
		}
		
		String pageSize = "10";
		String pageNo = "1";
		String numOfRows = "10";
		String startPage = "1";
		
		url += "&pageSize=" + pageSize;
		url += "&pageNo=" + pageNo;
		url += "&numOfRows=" + numOfRows;
		url += "&startPage=" + startPage;
		url += "&areaCode=" + areaCode;
		url += "&eventStartDate=" + eventStartDate.replaceAll("-", "");
		url += "&eventEndDate=" + eventEndDate.replaceAll("-", "");
		
		LOGGER.info("## getScheduleList api url ::::"+url);
		List resultList = (List) getXmlParsingData(url);
		
		return resultList;
	}

	
	@SuppressWarnings("rawtypes")
	public static List getXmlParsingData(String url){
		List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			Document doc = dBuilder.parse(url);
			doc.getDocumentElement().normalize();
			NodeList nList = doc.getElementsByTagName("item");
			
			for (int temp = 0; temp < nList.getLength(); temp++) {
				Node nNode = nList.item(temp);
				if (nNode.getNodeType() == Node.ELEMENT_NODE) {
					Element eElement = (Element) nNode;
					resultMap = new HashMap<String, Object>();
					for (int i = 0; i < eElement.getChildNodes().getLength() ; i++ ) {
						if(!eElement.getChildNodes().item(i).getNodeName().equals("#text")){
							resultMap.put(eElement.getChildNodes().item(i).getNodeName(), getTagValue(eElement.getChildNodes().item(i).getNodeName(), eElement));
						}
					}
				}
				resultList.add(temp, resultMap);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultList;
	}

	private static String getTagValue(String sTag, Element eElement) {
		String returnVal = "";
		if (eElement.getElementsByTagName(sTag).item(0) != null) {
			NodeList nlList = eElement.getElementsByTagName(sTag).item(0).getChildNodes();
			Node nValue = (Node) nlList.item(0);
			nlList.getLength();
			if ( nValue != null ) {
				returnVal= nValue.getTextContent();
			}
		}
		return returnVal;
	}

	/*지역코드 리스트 조회*/
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public List<Map<String, Object>> getAreaList() {
		String url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaCode?serviceKey=JZluWzN7N9c08lN8Xa4k4MEWUbNY0aC%2B0UNowlQfK9d0hzoPZQFpLg7KRSnmaACu47KhBTl48XXGOVWap8AWrQ%3D%3D&numOfRows=20&pageNo=1&MobileOS=ETC&MobileApp=AppTest";
		String pageSize = "20";
		String pageNo = "1";
		String numOfRows = "20";
		String startPage = "1";
		url += "&pageSize=" + pageSize;
		url += "&pageNo=" + pageNo;
		url += "&numOfRows=" + numOfRows;
		url += "&startPage=" + startPage;
		
		LOGGER.info("## getAreaList api url ::::"+url);
		List resultList = (List) getXmlParsingData(url);
		
		return resultList;
	}


	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public Map<String, Object> getScheduleDetail(Map<String, Object> commandMap) throws Exception {
		
		String url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro?serviceKey=JZluWzN7N9c08lN8Xa4k4MEWUbNY0aC%2B0UNowlQfK9d0hzoPZQFpLg7KRSnmaACu47KhBTl48XXGOVWap8AWrQ%3D%3D&MobileOS=ETC&MobileApp=AppTest&introYN=Y";
		String contentId = (String) commandMap.get("contId");
		String contentTypeId = "15";
		String pageSize = "1";
		String pageNo = "1";
		String numOfRows = "1";
		String startPage = "1";
		
		url += "&contentId=" + contentId;
		url += "&contentTypeId=" + contentTypeId;
		url += "&pageSize=" + pageSize;
		url += "&pageNo=" + pageNo;
		url += "&numOfRows=" + numOfRows;
		url += "&startPage=" + startPage;
		
		LOGGER.info("## getScheduleDetail api url ::::"+url);
		List resultList = (List) getXmlParsingData(url);
		commandMap = (Map<String, Object>) resultList.get(0);
		return commandMap;
	}


	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public List<Map<String, Object>> getRecentList(Map<String, Object> commandMap) throws Exception {
		String url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchFestival?serviceKey=JZluWzN7N9c08lN8Xa4k4MEWUbNY0aC%2B0UNowlQfK9d0hzoPZQFpLg7KRSnmaACu47KhBTl48XXGOVWap8AWrQ%3D%3D&MobileOS=ETC&MobileApp=AppTest&arrange=A&listYN=Y&eventStartDate=20170901";
		
		String areaCode = "1";
		if (commandMap.get("areaSelectList") != null && commandMap.get("areaSelectList") != "") {
			areaCode = (String) commandMap.get("areaSelectList");
		}
		
		String pageSize = "10";
		String pageNo = "1";
		String numOfRows = "4";
		String startPage = "1";
		String arrange = "D";
		
		url += "&pageSize=" + pageSize;
		url += "&pageNo=" + pageNo;
		url += "&numOfRows=" + numOfRows;
		url += "&startPage=" + startPage;
		url += "&areaCode=" + areaCode;
		url += "&arrange=" + arrange;
		
		
		LOGGER.info("## getRecentList api url ::::"+url);
		List resultList = (List) getXmlParsingData(url);
		
		return resultList;
	}

}
