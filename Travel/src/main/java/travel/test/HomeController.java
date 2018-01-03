package travel.test;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	@RequestMapping(value = "/searchPost.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> searchPost() throws Exception {
		Map map = new HashMap<String, Object>();
		map.put("1", 1);
		return map;
	}
	
	/**
	 * GET 방식으로 값을 전달하는 방법 입니다.
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/searchGet.do", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> searchGet() throws Exception {
		Map map = new HashMap<String, Object>();
		map.put("1", 1);
		return map;
	}
}
