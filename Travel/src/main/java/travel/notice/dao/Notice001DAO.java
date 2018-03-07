package travel.notice.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository("notice001DAO")
public class Notice001DAO extends EgovAbstractMapper {

	public List<?> selectNotice001List() throws Exception{
		return selectList("notice001.selectNotice001List", null);
	}

	public int updateNotice001(Map<String, Object> map) {
		return update("notice001.updateNotice001", map);
	}
}
