package travel.user.service;

import java.util.List;
import java.util.Map;

public interface User001Service {

	List<Map<String, Object>> selectUser001ListAjax() throws Exception;

	int insertUser001(Map<String, Object> map) throws Exception;

}
