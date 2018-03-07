package travel.schedule.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.json.simple.JSONValue;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springmodules.validation.commons.DefaultBeanValidator;

import travel.common.controller.CommonController;
import travel.schedule.service.Schedule001Service;
import egovframework.rte.fdl.property.EgovPropertyService;

@Controller
public class Schedule001Controller {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(Schedule001Controller.class);
	
	@Resource(name = "schedule001Service")
	private Schedule001Service schedule001Service;
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;	
	
	@RequestMapping(value="/schedule/schdule001List")
	public ModelAndView selectSchdule001List(HttpServletRequest request, @RequestParam Map<String, Object> map) throws Exception {
		ModelAndView mv = new ModelAndView();
/*		List<Map<String, Object>> dataList = schedule001Service.selectSchdule001List(map);
		mv.addObject("dataList", dataList);*/
		mv.setViewName("/schedule/schedule001List");
		return mv;
	}	
	
/*	@RequestMapping(value="/schedule/schedule001ListAjax", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selectSchdule001ListAjax(@RequestParam Map<String, Object> map) throws Exception{
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<Map<String, Object>> dataList = schedule001Service.selectSchdule001ListAjax(map);
		resultMap.put("dataList", dataList);
		return resultMap;
	}*/
	
/*	@RequestMapping(value="/schedule/schedule001ListAjaxEx1", method = RequestMethod.POST)
	@ResponseBody
	public void schedule001ListAjaxEx1(@RequestParam Map<String, Object> map) throws Exception{
		System.out.println("userId:"+map.get("userId"));
		System.out.println("userPass:"+map.get("userPass"));
		System.out.println("map2:"+map.get("checkValues"));
		System.out.println("map3:"+map.get("checkValues2"));	
		
		String dataList = schedule001Service.selectSchdule001ListAjaxEx1(map);
		System.out.println("dataList:"+dataList);
	}*/
	
	@RequestMapping(value="/schedule/schedule001ListAjax", method = RequestMethod.POST)
	@ResponseBody
	public String selectSchdule001ListAjax(@RequestBody String param) throws Exception{
		LOGGER.info("param:"+param);
		
/*		JSONObject json1 = JSONObject.fromObject(param);
		System.out.println("json1:"+json1.get("userId"));
		System.out.println("json1:"+json1.get("checkValues"));
		JSONArray jsonArray = new JSONArray();
		jsonArray = (JSONArray) json1.get("checkValues");
		for(int i=0; i<jsonArray.size(); i++){
			System.out.println("jsonArray:"+jsonArray.get(i));
		}
		*/
		String dataList = schedule001Service.selectSchdule001ListAjax(param);
		LOGGER.info("dataList:"+dataList);
		return dataList;
	}
	
/*	@RequestMapping(value="/schedule/schedule001ListAjax3", method = RequestMethod.POST)
	@ResponseBody
	public String selectSchdule001ListAjax3(@RequestBody String param) throws Exception{
		
		System.out.println("param11:"+param);
		
		JSONObject json1 = JSONObject.fromObject(param);
		System.out.println("json1:"+json1.get("userId"));
		System.out.println("json1:"+json1.get("checkValues"));
		JSONArray jsonArray = new JSONArray();
		jsonArray = (JSONArray) json1.get("checkValues");
		for(int i=0; i<jsonArray.size(); i++){
			System.out.println("jsonArray:"+jsonArray.get(i));
		}
		
		Map<String, Object> map2 = new HashMap<String, Object>();
		String dataList = schedule001Service.selectSchdule001ListAjax2(map2);
		System.out.println("dataList:"+dataList);
		return dataList;
	}	*/
}
