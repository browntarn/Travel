package travel.notice.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import travel.notice.service.Notice001Service;

@Controller
public class Notice001Controller {
	//private static final Logger LOGGER = LoggerFactory.getLogger(Notice001Controller.class);
	private static final Logger logger = LogManager.getLogger(); 
	
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
	public String selectNotice001ListAjax() throws Exception{
		JSONObject jsonObject = new JSONObject();
		List<Map<String, Object>> listData = notice001Service.selectNotice001ListAjax();
		jsonObject.put("listData", listData);
		logger.info("returnData:"+jsonObject.toString());
		//return new Gson().toJsonTree(list).toString();
		return jsonObject.toString();
	}
	
	@RequestMapping(value = "/notice/updateNotice001")
	public String updateNotice001(@RequestParam Map<String,Object> map) throws Exception{
		System.out.println("TITLE:"+map.get("TITLE"));
		System.out.println("SEQ:"+map.get("SEQ"));
		System.out.println("SEQ1:"+map.get("SEQ1"));
		System.out.println("id:"+map.get("id"));
		System.out.println("cellName:"+map.get("cellName"));
		System.out.println("cellValue:"+map.get("cellValue"));
		notice001Service.updateNotice001(map);
		return "aa";
	}
}
