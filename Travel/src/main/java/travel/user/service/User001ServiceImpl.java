package travel.user.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import travel.user.dao.User001DAO;

@Service("user001Service")
public class User001ServiceImpl implements User001Service{

	@Resource(name = "user001DAO")
	private User001DAO user001DAO;

	@Override
	public List<Map<String, Object>> selectUser001ListAjax() throws Exception {
		return (List<Map<String, Object>>) user001DAO.selectUser001List();
	}  
}
