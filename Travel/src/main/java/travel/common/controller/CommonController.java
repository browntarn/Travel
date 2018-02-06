package travel.common.controller;

import javax.annotation.Resource;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import travel.common.service.CommonService;

@Controller
public class CommonController {
	
	private static final Logger logger = LogManager.getLogger(CommonController.class);

	@Resource(name="commonService")
	private CommonService commonService;
	
	@RequestMapping(value="/common/selectAreaCode")
	@ResponseBody
	public String selectAreaCode() throws Exception{
		return commonService.selectAreaCode();
	}
	
	@RequestMapping(value="/common/selectSigunguCode")
	@ResponseBody
	public String selectSigunguCode(@RequestBody String param) throws Exception{
		logger.info("param:"+param);
		return commonService.selectSigunguCode(param);
	}
	
}
