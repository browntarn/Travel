package travel.login.dao;

import java.util.Map;
import org.springframework.stereotype.Repository;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import travel.api.naver.vo.NaverUser;

@Repository("login001DAO")
public class Login001DAO extends EgovAbstractDAO{

	@SuppressWarnings("unchecked")
	public Map<String, Object> getUserByNaverUser(NaverUser naverUser) throws Exception{
		return 	(Map<String, Object>) select("login.SelectUser", naverUser);
	}
}
