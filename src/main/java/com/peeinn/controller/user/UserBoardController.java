package com.peeinn.controller.user;

import java.io.FileInputStream;
import java.io.InputStream;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/user/")
public class UserBoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserBoardController.class);
	@Resource(name="userUploadPath") 
	private String userUploadPath;

	/* ------------------- [ QNA PART ] ------------------- */

	@RequestMapping(value="qna/list", method=RequestMethod.GET)
	public void qnaList() {
		logger.info("------------ [qnaList GET] ------------");
		
	}  
	
	@RequestMapping(value="qna/regist", method=RequestMethod.GET)
	public void qnaRegistGet() {
		logger.info("------------ [qnaRegist GET] ------------");
		
	}
	
	@RequestMapping(value="qna/read", method=RequestMethod.GET)
	public void qnaReadGet() {
		logger.info("------------ [qnaRead GET] ------------");
		
	}
	
	/* ------------------- [ UPLOAD PART ] ------------------- */
	@RequestMapping(value="displayFile", method=RequestMethod.GET)
	public ResponseEntity<byte[]> displayFile(String fileName){
		logger.info("--------- displayFile ---------");
//		logger.info("fileName: " + fileName);
		ResponseEntity<byte[]> entity = null;
		
		try {
			//확장자
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
			MediaType type = null;
			
			if(formatName.equalsIgnoreCase("jpg") || formatName.equalsIgnoreCase("jpeg")) {
				type = MediaType.IMAGE_JPEG;
			} else if(formatName.equalsIgnoreCase("png")) {
				type = MediaType.IMAGE_PNG;
			} else if(formatName.equalsIgnoreCase("gif")) {
				type = MediaType.IMAGE_GIF;
			}
			
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(type);
			
			//파일을 읽어들임
			InputStream in = new FileInputStream(userUploadPath + "/" + fileName);
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), //바이트 배열을 리턴
												headers,
												HttpStatus.CREATED);
			in.close(); //InputStream은 사용 완료 후 꼭 close를 해줘야 다른 곳에서 이 파일에 접근 가능함.
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	

}//BoardController
