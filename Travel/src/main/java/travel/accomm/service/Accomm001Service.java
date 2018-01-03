package travel.accomm.service;

import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.ui.ModelMap;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface Accomm001Service {

	List<Map<String, Object>> selectAccomm001List(Map<String, Object> map) throws Exception;

	String accomm001ListAjax(Map<String, Object> map) throws Exception;
}
