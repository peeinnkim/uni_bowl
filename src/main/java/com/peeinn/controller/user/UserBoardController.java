package com.peeinn.controller.user;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.peeinn.domain.NoticeAttachVO;
import com.peeinn.domain.NoticeVO;
import com.peeinn.domain.QnAAttachVO;
import com.peeinn.domain.QnAVO;
import com.peeinn.domain.paging.PageMaker;
import com.peeinn.domain.paging.SearchCriteria;
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
	public void qnaList(Model model, SearchCriteria cri) {
		logger.info("------------ [qnaList GET] ------------");
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(qnaService.qnaCnt());
		
		model.addAttribute("list", qnaService.list());
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("cri", cri);
	}  
	
	@RequestMapping(value="read", method=RequestMethod.GET)
	public void qnaReadGet(Model model, int qnaNo) {
		logger.info("------------ [qnaRead GET] ------------");
		
		model.addAttribute("qna", qnaService.read(qnaNo));
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
		
		System.out.println("controller namekey ->>>>>>>>>" + vo.getQnaWriterId());
		
		List<QnAAttachVO> qaList = new ArrayList<QnAAttachVO>();
		
		for(MultipartFile file: imageFiles) {
			if(!file.isEmpty()) {
				logger.info(file.getOriginalFilename() + " / " + file.getSize());
				
				String thumbName = UploadFileUtils.uploadFile(userUploadPath, 
															  vo.getQnaWriterId(),
														      file.getOriginalFilename(), 
														      file.getBytes());	
				String originName = UploadFileUtils.getOriginalFileName(vo.getQnaWriterId(), thumbName);
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
	
	@RequestMapping(value="modify", method=RequestMethod.GET)
	public String modifyGet(Model model, int qnaNo) {
		logger.info("------------ [modify GET] ------------");
		
		model.addAttribute("qna", qnaService.read(qnaNo));
		
		return "/user/qna/inputForm";
	}
	
	@RequestMapping(value="modify", method=RequestMethod.POST)
	public String modifyPost(Model model, QnAVO vo, String[] delFiles, List<MultipartFile> imageFiles) throws IOException {
		logger.info("------------ [modify POST] ------------");
		
		List<QnAAttachVO> qaList = new ArrayList<QnAAttachVO>();
		
		for(MultipartFile file: imageFiles) {
			if(!file.isEmpty()) {
				logger.info(file.getOriginalFilename() + " / " + file.getSize());
				
				String thumbName = UploadFileUtils.uploadFile(userUploadPath, 
															  vo.getQnaWriterId(),
														      file.getOriginalFilename(), 
														      file.getBytes());	
				String originName = UploadFileUtils.getOriginalFileName(vo.getQnaWriterId(), thumbName);
				qaList.add(new QnAAttachVO(0, thumbName, originName, 0));
			}
		}
		
		//파일 삭제 
		if(delFiles != null) { //파일 삭제를 아무것도 안하면 null이 넘어오니까 예외처리 해줘야함
			for(String fileName : delFiles) {
				UploadFileUtils.deleteFile(userUploadPath, vo.getQnaWriterId(), fileName);
			}
		}
		
		QnAVO qna = new QnAVO();
		qna.setQnaNo(vo.getQnaNo());
		qna.setQnaTitle(vo.getQnaTitle());
		qna.setQnaContent(vo.getQnaContent());
		qna.setQnaCategory(vo.getQnaCategory());
		qna.setFiles(qaList);
		
		qnaService.modify(qna, delFiles);
		
		return "redirect:/user/qna/read?qnaNo=" + qna.getQnaNo();
	}
	
	@RequestMapping(value="remove", method=RequestMethod.GET)
	public void removeNotice(int qnaNo, HttpServletResponse response) throws IOException {
		logger.info("------------ [removeNotice POST] ------------");
		
		QnAVO qna = qnaService.read(qnaNo);
		
		for(QnAAttachVO qa : qna.getFiles()) {
			UploadFileUtils.deleteFile(userUploadPath, qna.getQnaWriterId(), qa.getQaThumb());
		}
		
		qnaService.remove(qnaNo);
		response.sendRedirect("list");
	}
	
	@ResponseBody
	@RequestMapping(value="searchList", method=RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> searchList(SearchCriteria cri){
		ResponseEntity<Map<String, Object>> entity = null;
		
		try {
			List<QnAVO> list = qnaService.listSearch(cri);
			System.out.println("list ->>>>>>>>" + list);

			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(qnaService.listSearchCnt(cri));
			System.out.println("pageMaker ->>>>>>>" + pageMaker);
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("list", list);
			map.put("pageMaker", pageMaker);
		
			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
			
		} catch (Exception e) {
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		
		return entity;
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
