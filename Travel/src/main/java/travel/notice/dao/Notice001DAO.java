package travel.notice.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("notice001DAO")
public class Notice001DAO extends EgovAbstractDAO {

	public List<?> selectNotice001List() {
		System.out.println("여기까지왔음");
		return list("notice001DAO.selectNotice001List");
	}

}
