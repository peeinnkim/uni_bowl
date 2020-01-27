package com.peeinn.controller.user;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.peeinn.service.ProgramService;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private ProgramService pgService;
	
	
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
	
	
	/* ------------------- [ MENU PART ] ------------------- */
	@RequestMapping(value="/user/pg", method=RequestMethod.GET)
	public String pgList(Model model) {
		logger.info("------------ [PROGRAM LIST] ------------");
	
		model.addAttribute("list", pgService.list());
		return "user/menu/pgList";
	}

	@RequestMapping(value="/user/pgDetail", method=RequestMethod.GET)
	public String pgDetail(Model model, int pgNo) {
		logger.info("------------ [PROGRAM DETAIL] ------------");
		
		model.addAttribute("pg", pgService.search(pgNo));
		return "user/menu/pgDetail";
	}
	
	@RequestMapping(value="/user/th", method=RequestMethod.GET)
	public String thList(Model model) {
		logger.info("------------ [THEATER LIST] ------------");
		
		return "user/menu/thList";
	}
	
	
	
	
	
	
	
	
	
}//HomeController
