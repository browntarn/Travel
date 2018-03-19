package travel.user.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository("user001DAO")
public class User001DAO extends EgovAbstractMapper{

	public List<?> selectUser001List() throws Exception{
		return selectList("user001.selectUser001List", null);
	}
}
