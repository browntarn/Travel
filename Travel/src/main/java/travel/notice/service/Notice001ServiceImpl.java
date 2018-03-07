package travel.notice.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import travel.notice.dao.Notice001DAO;

@Service("notice001Service")
public class Notice001ServiceImpl implements Notice001Service{
	
	@Resource(name="notice001DAO")
	private Notice001DAO notice001DAO;

	@Override
	public List<Map<String, Object>> selectNotice001ListAjax() throws Exception {
		return (List<Map<String, Object>>) notice001DAO.selectNotice001List();
	}

	@Override
	public void updateNotice001(Map<String, Object> map) throws Exception {
		notice001DAO.updateNotice001(map);
	}

}
