package com.peeinn.controller.admin;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.peeinn.domain.QnAReplyVO;
import com.peeinn.service.ReplyService;

@RestController
@RequestMapping("/admin/replies/")
public class ReplyController {

	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);
	@Autowired
	private ReplyService service;
	
	@RequestMapping(value="{qnaNo}", method=RequestMethod.GET)
	public ResponseEntity<List<QnAReplyVO>> listAll(@PathVariable("qnaNo") int qnaNo) {
		logger.info("------------ [listAll] ------------");
		ResponseEntity<List<QnAReplyVO>> entity = null;
		
		try {
			List<QnAReplyVO> list = service.listByQnaNo(qnaNo);
			entity = new ResponseEntity<List<QnAReplyVO>>(list, HttpStatus.OK); //200
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<QnAReplyVO>>(HttpStatus.BAD_REQUEST); //400 error
		}
		
		return entity;
	}
	
	@RequestMapping(value="add", method=RequestMethod.POST)
	public ResponseEntity<String> regist(@RequestBody QnAReplyVO vo){
		logger.info("------------ [registReply] ------------");
		logger.info("vo->>>>>" + vo.toString());
		ResponseEntity<String> entity = null;
		
		try {
			service.regist(vo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	
	@RequestMapping(value="{rpNo}", method=RequestMethod.PUT)
	public ResponseEntity<String> modify(@RequestBody QnAReplyVO vo, @PathVariable("rpNo") int rpNo) {
		logger.info("----------modify----------");
		logger.info(vo.toString() + ", " + rpNo);
		ResponseEntity<String> entity = null;
		
		try {
			vo.setQnaNo(rpNo);
			service.modify(vo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="{qnaNo}", method=RequestMethod.DELETE)
	public ResponseEntity<String> delete(@PathVariable("rpNo") int rpNo) {
		logger.info("----------delete----------");
		logger.info("rpNo: "+rpNo);
		ResponseEntity<String> entity = null;
		
		try {
			service.remove(rpNo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
}//ReplyController
