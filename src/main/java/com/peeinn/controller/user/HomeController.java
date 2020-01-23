package com.peeinn.controller.user;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpSession session) {
		logger.info("------------ [HOME] ------------");
		//세션에 저장한 임시정보 삭제
		session.removeAttribute("tempPay");
		session.removeAttribute("seatList");
		session.removeAttribute("tempOres");
		
		return "home";
	}

	@RequestMapping(value = "/error", method = RequestMethod.GET)
	public void error() {
		logger.info("------------ [ERROR] ------------");
	}
	
}
