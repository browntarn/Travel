package travel.accomm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import travel.accomm.service.Accomm001Service;

/**   
* @Title: Accomm001Controller.java 
* @Package egovframework.travel.accomm.controller 
* @Description: TODO(설명) 
* @author 김성우  
* @date 2017. 11. 14. 
* @version V1.0   
*/ 
@Controller
public class Accomm001Controller {

	@Resource(name="accomm001Service")
	private Accomm001Service accomm001Service;

	/**
	 * 숙박시설을 조회한다.
	 * @param Map - 목록 조회조건 정보
	 * @return "selectAccomm001List"
	 * @exception Exception
	 */	
	@RequestMapping(value="/accomm/accomm001List")
	//public ModelAndView selectAccomm001List(@RequestParam Map<String, Object> map) throws Exception{
	public ModelAndView selectAccomm001List(ModelMap map) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<Map<String, Object>> dataList = accomm001Service.selectAccomm001List(map);		
		mv.addObject("resultList", dataList);
		mv.setViewName("/accomm/accomm001List");
		return mv;
	}
	
	@RequestMapping(value="/accomm/accomm001ListAjax", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> accomm001ListAjax(@RequestParam Map<String, String> paramMap) throws Exception{
		System.out.println("paramMap:"+paramMap.get("aa"));
		Map map = new HashMap<String, String>();
	    map.put("code","1");
	    map.put("msg", "등록하였습니다.");
	    return map;
    }
	
	@RequestMapping(value="/accomm/accomm001ListAjax2", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> searchGet(@RequestParam Map<String, String> paramMap) throws Exception {
		System.out.println("paramMap:"+paramMap.get("aa"));
	    Map map = new HashMap<String, String>();
	    map.put("code","2");
	    map.put("msg", "등록하였습니다.");
		return map;
	}

}
