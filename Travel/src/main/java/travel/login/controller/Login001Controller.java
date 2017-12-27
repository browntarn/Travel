package travel.login.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.scribejava.core.model.OAuth2AccessToken;

import travel.api.naver.common.NaverLoginCommon;
import travel.api.naver.vo.NaverUser;
import travel.login.service.Login001Service;

@Controller
public class Login001Controller {
	
	Logger log = Logger.getLogger(this.getClass());
	@Resource(name="naverLoginCommon")
	private NaverLoginCommon naverLoginCommon;
	
	@Resource(name="login001Service")
	private Login001Service login001Service;

	@RequestMapping("/login/indexLoginForm.do")
	public ModelAndView loginForm(HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		String naverUrl = naverLoginCommon.getAuthorizationUrl(session);
		log.debug("로그인창 호출");
		mv.addObject("loginFlag", "Y");
		mv.addObject("naverUrl", naverUrl);		
		mv.setViewName("login/indexLoginForm");
		return mv;
	}

    @RequestMapping("/login/naverCallback.do")
    public ModelAndView callback(@RequestParam String code, @RequestParam String state, HttpSession session, RedirectAttributes redirectAttributes) throws Exception {
    	ModelAndView mv = new ModelAndView();
    	/* 네이버 아이디로 로그인 인증이 끝나면 callback처리과정에서 AccessToken을 발급받을 수 있다. */
    	OAuth2AccessToken oauthToken = naverLoginCommon.getAccessToken(session, code, state);
    	
    	/* 발급받은 AccessToken을 이용하여 현재 로그인한 네이버의 사용자 프로필 정보를 조회할 수 있다. */
    	log.info("oauthToken:"+oauthToken.toString());
    	NaverUser naverUser = naverLoginCommon.getUserProfile(oauthToken);
    	System.out.println("naverUser:"+naverUser);
        /* 네이버 사용자 프로필 정보를 이용하여 가입되어있는 사용자를 DB에서 조회하여 가져온다. */
    	Map<String,Object> user = login001Service.getUserByNaverUser(naverUser);
    	if(user == null){  	
    		log.info("로그인 정보없음");
    		mv.setViewName("/login/indexRedirect");
    		mv.addObject("url", "/login/indexJoinForm.do");
    	}else{
    		if(user.get("NAVER_LOGIN_FLAG") == null || user.get("NAVER_LOGIN_FLAG").equals("") || user.get("NAVER_LOGIN_FLAG").equals("N")){
    			log.info("네이버 연동 로그인 체크안 했을경우");
        		mv.setViewName("/login/indexRedirect");
        		mv.addObject("url", "/login/indexAgreeForm.do");
        		mv.addObject("url", "/login/indexAgreeForm.do");
    		}else if(user.get("NAVER_LOGIN_FLAG").equals("Y")){
    			log.info("네이버 연동 로그인 OK 했을경우");
    			mv.setViewName("/login/indexRedirect");
    			mv.addObject("url", "/indexMain.do");
    		}
    	}
    	return mv;
        
        /* 만약 일치하는 사용자가 없다면 현재 로그인한 네이버 사용자 계정으로 회원가입이 가능하도록 가입페이지로 전달한다 */
        //if( snsUser == null ) {
       // 	return new ModelAndView("redirect:/join/naver");
       // }
        
        /* 만약 일치하는 사용자가 있다면 현재 세션에 사용자 로그인 정보를 저장 */
       // session.setAttribute("SNS_USER",snsUser);
       // return new ModelAndView("redirect:/account");
    }
	
}
