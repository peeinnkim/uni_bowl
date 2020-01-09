package com.peeinn.controller.user;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/user/rsv/")
public class RsvController {

	private static final Logger logger = LoggerFactory.getLogger(RsvController.class);
	
	@RequestMapping(value="step01", method=RequestMethod.GET)
	public void registRsv1() {
		logger.info("------------ [RSV1 GET] ------------");
	}
	
	@RequestMapping(value="list", method=RequestMethod.GET)
	public void rsvList() {
		logger.info("------------ [rsvList GET] ------------");
	}
	
}//RsvController
