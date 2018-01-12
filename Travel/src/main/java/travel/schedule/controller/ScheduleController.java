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

import egovframework.rte.fdl.property.EgovPropertyService;
import travel.schedule.service.ScheduleService;


@Controller
public class ScheduleController {

	/** EgovSampleService */
	@Resource(name = "scheduleService")
	private ScheduleService scheduleService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/schedule/scheduleList.do")
	public ModelAndView getScheduleList(HttpServletRequest request, @RequestParam Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		if (commandMap.get("areaSelectList") == null) {
			commandMap.put("areaSelectList", "1");
		}
		List<Map<String, Object>> areaList = scheduleService.getAreaList();
		List<Map<String, Object>> schList = scheduleService.getScheduleList(commandMap);
		List<Map<String, Object>> recentList = scheduleService.getRecentList(commandMap);
		request.setAttribute("resultList", schList);
		request.setAttribute("recentList", recentList);
		request.setAttribute("areaList", areaList);
		mv.addObject("commandMap", commandMap);
		mv.setViewName("/schedule/scheduleList");
		return mv;
	}

	@RequestMapping(value = "/schedule/scheduleDetail.do")
	public ModelAndView getScheduleDetail(HttpServletRequest request, @RequestParam Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		Map<String, Object> detailResult = scheduleService.getScheduleDetail(commandMap);
		request.setAttribute("detailResult", detailResult);
		mv.addObject("commandMap", commandMap);
		mv.setViewName("/schedule/scheduleDetail");
		return mv;
	}
	
}
