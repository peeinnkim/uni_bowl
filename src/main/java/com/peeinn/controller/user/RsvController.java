package com.peeinn.controller.user;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.peeinn.service.OrgService;

@Controller
@RequestMapping("/user/rsv/")
public class RsvController {

	private static final Logger logger = LoggerFactory.getLogger(RsvController.class);
	@Autowired
	private OrgService orgService;
	
	@RequestMapping(value="step01", method=RequestMethod.GET)
	public void registRsv1(Model model) {
		logger.info("------------ [RSV1 GET] ------------");
		
		model.addAttribute("list", orgService.orgByDateList(""));
	}
	@RequestMapping(value="step02", method=RequestMethod.GET)
	public void registRsv2(Model model) {
		logger.info("------------ [RSV1 GET] ------------");
		
	}
	@RequestMapping(value="step03", method=RequestMethod.GET)
	public void registRsv3(Model model) {
		logger.info("------------ [RSV1 GET] ------------");
		
	}
	@RequestMapping(value="step04", method=RequestMethod.GET)
	public void registRsv4(Model model) {
		logger.info("------------ [RSV1 GET] ------------");
		
	}
	
	@RequestMapping(value="list", method=RequestMethod.GET)
	public void rsvList() {
		logger.info("------------ [rsvList GET] ------------");
	}
	
}//RsvController
