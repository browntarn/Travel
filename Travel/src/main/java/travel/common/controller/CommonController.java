package travel.common.controller;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import travel.common.service.CommonService;

@Controller
public class CommonController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(CommonController.class);

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
		LOGGER.info("param:"+param);
		return commonService.selectSigunguCode(param);
	}
	
}
