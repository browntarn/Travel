package travel.accomm.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import travel.common.Api.apiCommon;
import egovframework.rte.fdl.property.EgovPropertyService;

@Service("accomm001Service")
public class Accomm001ServiceImpl implements Accomm001Service{

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	@Override
	public List<Map<String, Object>> selectAccomm001List(Map<String, Object> map) throws Exception {
		
		String accommUrl = propertiesService.getString("accommUrl");
		String authenticationKey = propertiesService.getString("authenticationKey");
		
		//String url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchStay?ServiceKey=4lBgY9cDqJIpN1Z8iUbivpOCw0Gpz9wv89knT5YvKw0%2Fez7p%2FnHffV0EHiD6tGFirL6fw%2BQV20F1wM9KdokJxg%3D%3D&areaCode=&sigunguCode=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=12&pageNo=1";
		StringBuffer addUrl = new StringBuffer();
		addUrl.append(authenticationKey);  //인증키번호
		//addUrl.append("&categoryCode="); //서비스 분류코드 조회
		//addUrl.append("&areaBasedList="); //지역기반 관광정보 조회
		//addUrl.append("&locationBasedList="); //위치기반 관광정보 조회		
		//addUrl.append("&searchKeyword="); //키워드 검색 조회
		//addUrl.append("&searchFestival="); //행사정보 조회
		//addUrl.append("&searchStay="); //숙박정보 조회
		addUrl.append("&areaCode=");//지역번호 조회
		addUrl.append("&sigunguCode="); //시구군
		addUrl.append("&arrange=A"); //목록구분 A=제목수, B=조회순, C=수정일순, D=생성일순
		addUrl.append("&listYN=Y"); //목록구분 Y=목록, N= 개수
		addUrl.append("&numOfRows=20"); //한페이지 결과수
		addUrl.append("&pageNo=1"); //한페이지 결과수
		addUrl.append("&MobileOS=ETC"); //OS 구분 IOS(아이폰), AND(안드로이드), WIN(윈도우폰), ETC
		addUrl.append("&MobileApp=TourAPI3.0_Guide"); //서비스명
		//addUrl.append("&_type=json"); //JSON 타입
		
		//addUrl.append("&areaCode=&sigunguCode=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=12&pageNo=1");
		
		apiCommon apiCommon = new apiCommon();
		return apiCommon.getXmlParsing(accommUrl+addUrl.toString());
		
		//지역코드 조회
		//http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaCode?ServiceKey=4lBgY9cDqJIpN1Z8iUbivpOCw0Gpz9wv89knT5YvKw0%2Fez7p%2FnHffV0EHiD6tGFirL6fw%2BQV20F1wM9KdokJxg%3D%3D&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A
		
		//지역이 서울인 시군구 코드 정보를 조회
		//http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaCode?ServiceKey=4lBgY9cDqJIpN1Z8iUbivpOCw0Gpz9wv89knT5YvKw0%2Fez7p%2FnHffV0EHiD6tGFirL6fw%2BQV20F1wM9KdokJxg%3D%3D&areaCode=1&pageNo=1&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A

		//return null;
	}

	@Override
	public String accomm001ListAjax(Map<String, Object> map) throws Exception {
		
		String authenticationKey = propertiesService.getString("authenticationKey");
		String travelUrl = propertiesService.getString("accommUrl");
		StringBuffer addUrl = new StringBuffer();
		addUrl.append(authenticationKey);  //인증키번호
		//addUrl.append("&categoryCode="); //서비스 분류코드 조회
		//addUrl.append("&areaBasedList="); //지역기반 관광정보 조회
		//addUrl.append("&locationBasedList="); //위치기반 관광정보 조회		
		//addUrl.append("&searchKeyword="); //키워드 검색 조회
		//addUrl.append("&searchFestival="); //행사정보 조회
		//addUrl.append("&searchStay="); //숙박정보 조회
		addUrl.append("&areaCode=");//지역번호 조회
		addUrl.append("&sigunguCode="); //시구군
		addUrl.append("&arrange=A"); //목록구분 A=제목수, B=조회순, C=수정일순, D=생성일순
		addUrl.append("&listYN=Y"); //목록구분 Y=목록, N= 개수
		addUrl.append("&numOfRows=20"); //한페이지 결과수
		addUrl.append("&pageNo=1"); //한페이지 결과수
		addUrl.append("&MobileOS=ETC"); //OS 구분 IOS(아이폰), AND(안드로이드), WIN(윈도우폰), ETC
		addUrl.append("&MobileApp=TourAPI3.0_Guide"); //서비스명
		//addUrl.append("&_type=json"); //JSON 타입
		
		//addUrl.append("&areaCode=&sigunguCode=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=12&pageNo=1");
		
		apiCommon apiCommon = new apiCommon();
		return apiCommon.getJsonFromUrl(travelUrl+addUrl.toString());
	}
}
