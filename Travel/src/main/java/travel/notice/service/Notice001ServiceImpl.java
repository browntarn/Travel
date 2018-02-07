package travel.notice.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import travel.notice.dao.Notice001DAO;

@Service("notice001Service")
public class Notice001ServiceImpl implements Notice001Service{
	
	@Resource(name="notice001DAO")
	private Notice001DAO notice001DAO;

	@Override
	public void selectNotice001ListAjax() throws Exception {
		List<?> list = notice001DAO.selectNotice001List();
		System.out.println("list:"+list.size());
	}
}
