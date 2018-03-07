package travel.notice.service;

import java.util.List;
import java.util.Map;

public interface Notice001Service {

	List<Map<String, Object>> selectNotice001ListAjax() throws Exception;

	void updateNotice001(Map<String, Object> map) throws Exception;

}
