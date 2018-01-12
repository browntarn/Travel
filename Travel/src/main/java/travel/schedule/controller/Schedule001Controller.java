package travel.schedule.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springmodules.validation.commons.DefaultBeanValidator;

import travel.schedule.service.Schedule001Service;
import egovframework.rte.fdl.property.EgovPropertyService;

@Controller
public class Schedule001Controller {
	
	@Resource(name = "schedule001Service")
	private Schedule001Service schedule001Service;
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;	
	
	@RequestMapping(value = "/schedule/schdule001List.do")
	public ModelAndView selectSchdule001List(HttpServletRequest request, @RequestParam Map<String, Object> map) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<Map<String, Object>> dataList = schedule001Service.selectSchdule001List(map);
		mv.addObject("dataList", dataList);
		mv.setViewName("/schedule/schedule001List");
		return mv;
	}	
	
	@RequestMapping("/schdule/schdule001ListAjax.do")
	public ModelAndView selectSchdule001ListAjax(@RequestParam Map<String, Object> map) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<Map<String, Object>> dataList = schedule001Service.selectSchdule001ListAjax(map);
		mv.addObject("dataList", dataList);
		return mv;
	}
}
