package com.game.web;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.JsonNode;
import com.game.auth.web.KakaoRestApi;
import com.game.domain.LoginVO;
import com.game.service.LoginService;



@Controller
@RequestMapping("/login/*")
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Inject
<<<<<<< HEAD
	private LoginService service;
	
	@Inject
	BCryptPasswordEncoder pwdEncoder;		// 암호화 기능
=======
	BCryptPasswordEncoder pwdEncoder;		// �븫�샇�솕 湲곕뒫
>>>>>>> d3a74ac3c5ff4bfe38648e6848e2725c6a49b508
	
	private KakaoRestApi kakao_rest_api = new KakaoRestApi();
	
	
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public void login(Model model, HttpSession session) throws Exception {
		
		String KakaoUrl = kakao_rest_api.getAuthorizationUrl(session);
		//�깮�꽦�븳 �씤利� URL�쓣 View濡� �쟾�떖
		model.addAttribute("kakao_url", KakaoUrl);
		
		System.out.println("/login/login");
		
	}
	
	
	@RequestMapping(value = "/kakaoOauth.do")
	public String getKakaoSignIn(ModelMap model,@RequestParam("code") String code, HttpSession session) throws Exception {

		//JsonNode accessToketn = kakao_rest_api.getAccessToken(code);

		JsonNode userInfo = kakao_rest_api.getKakaoUserInfo(code);
				
		System.out.println(userInfo);

		String id = userInfo.get("id").toString();
		//String email = userInfo.get("kaccount_email").toString();
		String nickname = userInfo.get("properties").get("nickname").toString();

		System.out.println(nickname);


		model.addAttribute("k_userInfo", userInfo);
		model.addAttribute("id", id);
		//model.addAttribute("email", email);
	  	model.addAttribute("nickname", nickname);

	  	return "login/loginifo";
	}
	
	// �쉶�썝媛��엯 GET
	@RequestMapping(value = "/signUp.do", method = RequestMethod.GET)
	public void signUpGET(Model model) throws Exception {
		logger.info("get signUp");
	}
	
	// �쉶�썝媛��엯 POST
	@RequestMapping(value = "/signUp.do", method = RequestMethod.POST)
	public String signUpPOST(Map<String, Object> modelMap, LoginVO userInfo) throws Exception {
		logger.info("post signUp");
<<<<<<< HEAD
		
		// 비밀번호 암호화하여 userInfo에 넣어주기
		String pwd = pwdEncoder.encode(userInfo.getUserPW());
=======
		String pwd = pwdEncoder.encode(userInfo.getUserPW());		// �븫�샇�솕�븯�뿬 userInfo�뿉 �꽔�뼱二쇨린
>>>>>>> d3a74ac3c5ff4bfe38648e6848e2725c6a49b508
		userInfo.setUserPW(pwd);
		
		
		// System.out.println(pwdEncoder.matches("asdf1234", userInfo.getUserPW()));
		return "/login/signUp.do";
	}
	
	// ID 以묐났 �솗�씤
	@RequestMapping(value = "/idCheck.do", method = RequestMethod.POST)
	public void idCheck(HttpServletRequest request, String userID, HttpServletResponse response) throws Exception {
		JSONObject jsonObject = new JSONObject();
		boolean result = service.IDCheck(userID);
		jsonObject.put("result", result);
		try {
			response.getWriter().print(jsonObject);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
