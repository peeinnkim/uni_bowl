package com.peeinn.controller.user;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.peeinn.domain.AuthVO;
import com.peeinn.domain.QnAAttachVO;
import com.peeinn.domain.QnAVO;
import com.peeinn.service.QnAService;
import com.peeinn.util.UploadFileUtils;

@Controller
@RequestMapping("/user/qna/")
public class UserBoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserBoardController.class);
	@Resource(name="userUploadPath") 
	private String userUploadPath;
	@Autowired
	private QnAService qnaService;

	/* ------------------- [ QNA PART ] ------------------- */

	@RequestMapping(value="list", method=RequestMethod.GET)
	public void qnaList(Model model) {
		logger.info("------------ [qnaList GET] ------------");
		
		
		model.addAttribute("list", qnaService.list());
	}  
	
	@RequestMapping(value="regist", method=RequestMethod.GET)
	public String qnaRegistGet() {
		logger.info("------------ [qnaRegist GET] ------------");
		
		return "user/qna/inputForm";
	}

	@RequestMapping(value="regist", method=RequestMethod.POST)
	public void qnaRegistPost(QnAVO vo, List<MultipartFile> imageFiles, HttpServletRequest request, HttpServletResponse response) throws IOException {
		logger.info("------------ [qnaRegist POST] ------------");
		logger.info("controller vo ->>>>>>>" + vo);
		
		AuthVO auth = (AuthVO) request.getSession().getAttribute("Auth");
		String nameKey = auth.getAuthId();
		System.out.println("controller namekey ->>>>>>>>>" + nameKey);
		
		List<QnAAttachVO> qaList = new ArrayList<QnAAttachVO>();
		
		for(MultipartFile file: imageFiles) {
			if(!file.isEmpty()) {
				logger.info(file.getOriginalFilename() + " / " + file.getSize());
				
				String thumbName = UploadFileUtils.uploadFile(userUploadPath, 
															  nameKey,
														      file.getOriginalFilename(), 
														      file.getBytes());	
				String originName = UploadFileUtils.getOriginalFileName(nameKey, thumbName);
				qaList.add(new QnAAttachVO(0, thumbName, originName, 0));
			}
		}
		
		QnAVO qna = new QnAVO();
		qna.setQnaCategory(vo.getQnaCategory());
		qna.setQnaTitle(vo.getQnaTitle());
		qna.setQnaContent(vo.getQnaContent());
		qna.setQnaWriter(vo.getQnaWriter());
		qna.setFiles(qaList);
		qnaService.regist(qna);
		
		response.sendRedirect("list");
	}
	
	@RequestMapping(value="read", method=RequestMethod.GET)
	public void qnaReadGet() {
		logger.info("------------ [qnaRead GET] ------------");
		
	}
	
	/* ------------------- [ UPLOAD PART ] ------------------- */
	@RequestMapping(value="displayFile", method=RequestMethod.GET)
	public ResponseEntity<byte[]> displayFile(String fileName){
		logger.info("--------- displayFile ---------");
		logger.info("fileName: " + fileName);
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
