package travel.login.service;

import java.util.Map;
import travel.api.naver.vo.NaverUser;

public interface Login001Service {
	
	Map<String, Object> getUserByNaverUser(NaverUser naverUser) throws Exception;

}
