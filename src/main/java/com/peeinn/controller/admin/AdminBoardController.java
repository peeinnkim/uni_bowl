package com.peeinn.controller.admin;

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
import com.peeinn.domain.paging.PageMaker;
import com.peeinn.domain.paging.SearchCriteria;
import com.peeinn.service.NoticeService;
import com.peeinn.util.UploadFileUtils;

@Controller
@RequestMapping("/admin/")
public class AdminBoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminBoardController.class);
	@Autowired
	private NoticeService ntService;
	@Resource(name="adminUploadPath") 
	private String adminUploadPath;
	
	
	/* ------------------- [ NOTICE PART ] ------------------- */
	@RequestMapping(value="notice/list", method=RequestMethod.GET)
	public void noticeList(Model model, SearchCriteria cri) {
		logger.info("------------ [noticeList GET] ------------");
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(ntService.listSearchCnt(cri));
		
		model.addAttribute("list", ntService.listSearch(cri));
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("cri", cri);
	}
	
	@RequestMapping(value="notice/read", method=RequestMethod.GET)
	public void noticeRead(Model model, int ntNo) {
		logger.info("------------ [noticeRead GET] ------------");
		
		model.addAttribute("nt", ntService.read(ntNo));
	}
	
	@RequestMapping(value="notice/regist", method=RequestMethod.GET)
	public String noticeRegistGet() {
		logger.info("------------ [noticeRegist GET] ------------");
		
		return "/admin/notice/inputForm";
	}

	@RequestMapping(value="notice/regist", method=RequestMethod.POST)
	public void noticeRegistPost(NoticeVO nt, List<MultipartFile> imageFiles, HttpServletRequest request, HttpServletResponse response) throws IOException {
		logger.info("------------ [noticeRegist POST] ------------");
		logger.info("controller nt ->>>>>>>" + nt);
		
		List<NoticeAttachVO> naList = new ArrayList<NoticeAttachVO>();
		
		for(MultipartFile file: imageFiles) {
			if(!file.isEmpty()) {
				logger.info(file.getOriginalFilename() + " / " + file.getSize());
				
				String thumbName = UploadFileUtils.uploadFile(adminUploadPath, 
															  "notice",
														      file.getOriginalFilename(), 
														      file.getBytes());	
				String originName = UploadFileUtils.getOriginalFileName("notice", thumbName);
				naList.add(new NoticeAttachVO(0, thumbName, originName, 0));
			}
		}
		
		NoticeVO notice = new NoticeVO();
		notice.setNtWriter(nt.getNtWriter());
		notice.setNtTitle(nt.getNtTitle());
		notice.setNtContent(nt.getNtContent());
		notice.setNtIsFixed(nt.getNtIsFixed());
		notice.setFiles(naList);
		
		ntService.registNotice(notice);
		
		response.sendRedirect("list");
	}
	
	@RequestMapping(value="notice/modify", method=RequestMethod.GET)
	public String modifyGet(Model model, int ntNo) {
		logger.info("------------ [modify GET] ------------");
		
		model.addAttribute("nt", ntService.read(ntNo));
		
		return "/admin/notice/inputForm";
	}
	
	@RequestMapping(value="notice/modify", method=RequestMethod.POST)
	public String modifyPost(Model model, NoticeVO nt, String[] delFiles, List<MultipartFile> imageFiles) throws IOException {
		logger.info("------------ [modify POST] ------------");
		
		List<NoticeAttachVO> naList = new ArrayList<NoticeAttachVO>();
		
		for(MultipartFile file: imageFiles) {
			if(!file.isEmpty()) {
				logger.info(file.getOriginalFilename() + " / " + file.getSize());
				
				String thumbName = UploadFileUtils.uploadFile(adminUploadPath, 
															  "notice",
														      file.getOriginalFilename(), 
														      file.getBytes());	
				String originName = UploadFileUtils.getOriginalFileName("notice", thumbName);
				naList.add(new NoticeAttachVO(0, thumbName, originName, 0));
			}
		}
		
		//파일 삭제 
		if(delFiles != null) { //파일 삭제를 아무것도 안하면 null이 넘어오니까 예외처리 해줘야함
			for(String fileName : delFiles) {
				UploadFileUtils.deleteFile(adminUploadPath, "notice", fileName);
			}
		}
		
		NoticeVO notice = new NoticeVO();
		notice.setNtNo(nt.getNtNo());
		notice.setNtTitle(nt.getNtTitle());
		notice.setNtContent(nt.getNtContent());
		notice.setNtIsFixed(nt.getNtIsFixed());
		notice.setFiles(naList);
		
		ntService.modifyNotice(notice, delFiles);
		
		return "redirect:/admin/notice/read?ntNo=" + notice.getNtNo();
	}
	
	@RequestMapping(value="notice/remove", method=RequestMethod.GET)
	public void removeNotice(int ntNo, HttpServletResponse response) throws IOException {
		logger.info("------------ [removeNotice POST] ------------");
		
		NoticeVO notice = ntService.read(ntNo);
		
		for(NoticeAttachVO na : notice.getFiles()) {
			UploadFileUtils.deleteFile(adminUploadPath, "notice", na.getNaThumb());
		}
		
		ntService.removeNotice(ntNo);
		response.sendRedirect("list");
	}
	
	@ResponseBody
	@RequestMapping(value="notice/searchList", method=RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> searchList(SearchCriteria cri){
		ResponseEntity<Map<String, Object>> entity = null;
		
		try {
			List<NoticeVO> list = ntService.listSearch(cri);
			System.out.println("list ->>>>>>>>" + list);

			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(ntService.listSearchCnt(cri));
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
		logger.info("--------- ADMIN displayFile ---------");
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
			InputStream in = new FileInputStream(adminUploadPath + "/" + fileName);
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
