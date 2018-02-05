package travel.common.service;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.property.EgovPropertyService;
import travel.common.Api.apiCommon;

@Service("commonService")
public class CommonServiceImpl implements CommonService{
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;	

	@Override
	public String selectAreaCode() throws Exception {
		
		apiCommon apiCommon = new apiCommon();
		String areaCodeUrl = propertiesService.getString("areaCodeUrl");
		String authenticationKey = propertiesService.getString("authenticationKey");
		
		return apiCommon.commonAreaCode(areaCodeUrl, authenticationKey, "");
	}

	@Override
	public String selectSigunguCode(String param) throws Exception {
		
		JSONObject json = JSONObject.fromObject(param);
		apiCommon apiCommon = new apiCommon();
		String areaCodeUrl = propertiesService.getString("areaCodeUrl");
		String authenticationKey = propertiesService.getString("authenticationKey");
		String areaCode = (String) json.get("areaCode");
		
		return apiCommon.commonAreaCode(areaCodeUrl, authenticationKey, areaCode);
	}

}
