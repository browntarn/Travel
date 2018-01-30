package travel.test;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	private static final Logger LOGGER = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * 메인화면을 생성합니다.
	 * @return
	 */
	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public String home() {
		return "home";
	}
	
	/**
	 * POST 방식으로 값을 전달하는 방법 입니다.
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/goAjax1.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> goAjax1() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("AA", "1");
		map.put("BB", "2");
		map.put("CC", "3");
		map.put("DD", "4");
		return map;
	}
	
	@RequestMapping(value = "/goAjax2.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> goAjax2() throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("AA", "1");
		map.put("BB", "2");
		return map;
	}	
	@RequestMapping(value = "/goAjax3.do", method = RequestMethod.POST)
	public ModelAndView goAjax3() throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		mv.addObject("AA", "1");
		mv.addObject("BB", "2");
		return mv;
	}		

}
