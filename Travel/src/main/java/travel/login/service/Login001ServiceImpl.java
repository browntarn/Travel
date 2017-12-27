package travel.login.service;

import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import travel.api.naver.vo.NaverUser;
import travel.login.dao.Login001DAO;

@Service("login001Service")
public class Login001ServiceImpl implements Login001Service{

	@Resource(name="login001DAO")
	private Login001DAO login001DAO;

	@Override
	public Map<String, Object> getUserByNaverUser(NaverUser naverUser) throws Exception {
		return login001DAO.getUserByNaverUser(naverUser);
	}
}
