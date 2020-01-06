package com.peeinn.controller.user;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.peeinn.domain.NoticeAttachVO;
import com.peeinn.domain.NoticeVO;
import com.peeinn.service.NoticeService;
import com.peeinn.util.UploadFileUtils;

@Controller
@RequestMapping("/user/board/")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	@Autowired
	private NoticeService ntService;
	@Resource(name="uploadPath") 
	private String uploadPath;
	
	
	/* ------------------- [ NOTICE PART ] ------------------- */
	
	@RequestMapping(value="notice/list", method=RequestMethod.GET)
	public void noticeList(Model model) {
		logger.info("------------ [noticeList GET] ------------");
		
		model.addAttribute("list", ntService.list());
	}
	
	@RequestMapping(value="notice/regist", method=RequestMethod.GET)
	public String noticeRegistGet() {
		logger.info("------------ [noticeRegist GET] ------------");
		
		return "/user/board/notice/inputForm";
	}

	@RequestMapping(value="notice/regist", method=RequestMethod.POST)
	public void noticeRegistPost(NoticeVO nt, List<MultipartFile> imageFiles, HttpServletResponse response) throws IOException {
		logger.info("------------ [noticeRegist POST] ------------");
		logger.info("controller nt ->>>>>>>" + nt);
		
		List<NoticeAttachVO> naList = new ArrayList<NoticeAttachVO>();
		
		for(MultipartFile file: imageFiles) {
			if(!file.isEmpty()) {
				logger.info(file.getOriginalFilename() + " / " + file.getSize());
				
				String thumbName = UploadFileUtils.uploadFile(uploadPath, 
														      file.getOriginalFilename(), 
														      file.getBytes());	
				String originName = UploadFileUtils.getOriginalFileName(thumbName);
				naList.add(new NoticeAttachVO(0, thumbName, originName, 0));
			}
		}
		
		NoticeVO notice = new NoticeVO();
		notice.setNtTitle(nt.getNtTitle());
		notice.setNtContent(nt.getNtContent());
		notice.setNtIsFixed(nt.getNtIsFixed());
		notice.setFiles(naList);
		
		ntService.registNotice(notice);
		
		response.sendRedirect("list");
	}
	
	@RequestMapping(value="notice/read", method=RequestMethod.GET)
	public void noticeRead(Model model, int ntNo) {
		logger.info("------------ [noticeRead GET] ------------");
		
		model.addAttribute("nt", ntService.read(ntNo));
	}
	
	@RequestMapping(value="notice/modify", method=RequestMethod.GET)
	public String modifyGet(Model model, int ntNo) {
		logger.info("------------ [modify GET] ------------");
		
		model.addAttribute("nt", ntService.read(ntNo));
		
		return "/user/board/notice/inputForm";
	}
	
	@RequestMapping(value="notice/modify", method=RequestMethod.POST)
	public String modifyPost(Model model, NoticeVO nt, String[] delFiles, List<MultipartFile> imageFiles) throws IOException {
		logger.info("------------ [modify POST] ------------");
		
		List<NoticeAttachVO> naList = new ArrayList<NoticeAttachVO>();
		
		for(MultipartFile file: imageFiles) {
			if(!file.isEmpty()) {
				logger.info(file.getOriginalFilename() + " / " + file.getSize());
				
				String thumbName = UploadFileUtils.uploadFile(uploadPath, 
														      file.getOriginalFilename(), 
														      file.getBytes());	
				String originName = UploadFileUtils.getOriginalFileName(thumbName);
				naList.add(new NoticeAttachVO(0, thumbName, originName, 0));
			}
		}
		
		//파일 삭제 
		if(delFiles != null) { //파일 삭제를 아무것도 안하면 null이 넘어오니까 예외처리 해줘야함
			for(String fileName : delFiles) {
				UploadFileUtils.deleteFile(uploadPath, fileName);
			}
		}
		
		NoticeVO notice = new NoticeVO();
		notice.setNtNo(nt.getNtNo());
		notice.setNtTitle(nt.getNtTitle());
		notice.setNtContent(nt.getNtContent());
		notice.setNtIsFixed(nt.getNtIsFixed());
		notice.setFiles(naList);
		
		ntService.modifyNotice(notice);
		
		return "redirect:/user/board/notice/read?ntNo=" + notice.getNtNo();
	}
	
	@RequestMapping(value="notice/remove", method=RequestMethod.GET)
	public void removeNotice(int ntNo) {
		logger.info("------------ [removeNotice POST] ------------");
		
		NoticeVO notice = ntService.read(ntNo);
		
		for(NoticeAttachVO na : notice.getFiles()) {
			UploadFileUtils.deleteFile(uploadPath, na.getNaThumb());
		}
		
		ntService.removeNotice(ntNo);
	}
	
	/* ------------------- [ QNA PART ] ------------------- */

	@RequestMapping(value="qna/list", method=RequestMethod.GET)
	public void qnaList() {
		logger.info("------------ [qnaList GET] ------------");
		
	}  
	
	@RequestMapping(value="qna/regist", method=RequestMethod.GET)
	public void qnaRegistGet() {
		logger.info("------------ [qnaRegist GET] ------------");
		
	}
	

}//BoardController
