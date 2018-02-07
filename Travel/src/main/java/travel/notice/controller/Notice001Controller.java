package travel.notice.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import travel.notice.service.Notice001Service;

@Controller
public class Notice001Controller {
	
	@Resource(name = "notice001Service")
	private Notice001Service notice001Service;

	@RequestMapping(value = "/notice/notice001List")
	public ModelAndView selectNotice001List(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/notice/notice001List");
		return mv;
	}
	
	@RequestMapping(value = "/notice/notice001ListAjax")
	@ResponseBody
	public void selectNotice001ListAjax() throws Exception{
		notice001Service.selectNotice001ListAjax();
	}
}
