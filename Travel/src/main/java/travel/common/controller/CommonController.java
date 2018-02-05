package travel.common.controller;

import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import travel.common.service.CommonService;

@Controller
public class CommonController {

	@Resource(name="commonService")
	private CommonService commonService;
	
	@RequestMapping(value="/common/selectAreaCode.do")
	@ResponseBody
	public String selectAreaCode() throws Exception{
		return commonService.selectAreaCode();
	}
	
	@RequestMapping(value="/common/selectSigunguCode.do")
	@ResponseBody
	public String selectSigunguCode(@RequestBody String param) throws Exception{
		return commonService.selectSigunguCode(param);
	}
	
}
