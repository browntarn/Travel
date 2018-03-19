package travel.user.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import travel.user.service.User001Service;

@Controller
public class User001Controller {
	
	private static final Logger logger = LogManager.getLogger();

	@Resource(name = "user001Service")
	private User001Service user001Service;
	
	@RequestMapping(value = "/user/user001List")
	public ModelAndView selectUser001List(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/user/user001List");
		return mv;
	}
	
	@RequestMapping(value = "/user/user001ListAjax")
	@ResponseBody
	public String selectUser001ListAjax() throws Exception{
		JSONObject jsonObject = new JSONObject();
		List<Map<String,Object>> listData = user001Service.selectUser001ListAjax();
		jsonObject.put("listData", listData);
		logger.info("returnData:"+jsonObject.toString());
		return jsonObject.toString();
	}
}
