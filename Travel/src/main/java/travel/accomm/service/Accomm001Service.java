package travel.accomm.service;

import java.util.List;
import java.util.Map;

public interface Accomm001Service {

	List<Map<String, Object>> selectAccomm001List(Map<String, Object> map) throws Exception;

	String accomm001ListAjax(Map<String, Object> map) throws Exception;
}
