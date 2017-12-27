package travel.schedule.service;

import java.util.List;
import java.util.Map;


public interface ScheduleService {

	@SuppressWarnings("rawtypes")
	List getScheduleList(Map<String, Object> commandMap) throws Exception;

	List<Map<String, Object>> getAreaList() throws Exception;

	Map<String, Object> getScheduleDetail(Map<String, Object> commandMap) throws Exception;

	List<Map<String, Object>> getRecentList(Map<String, Object> commandMap) throws Exception;


	
}
