package com.peeinn.controller.admin;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.peeinn.controller.user.BoardController;

@Controller
@RequestMapping("/admin/intranet/")
public class IntranetController {
	
	private static final Logger logger = LoggerFactory.getLogger(IntranetController.class);

	/* ------------------- [ NOTICE PART ] ------------------- */
	
	@RequestMapping(value="memberMng", method=RequestMethod.GET)
	public void memberMng() {
		logger.info("------------ [memberMng GET] ------------");
	}
	
	
	
}//IntranetController
