package travel.schedule.service;

import java.util.List;
import java.util.Map;

public interface Schedule001Service {

	List<Map<String, Object>> selectSchdule001List(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectSchdule001ListAjax(Map<String, Object> map) throws Exception;

}
