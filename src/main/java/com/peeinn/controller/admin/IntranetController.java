package com.peeinn.controller.admin;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
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

import com.peeinn.domain.MemberVO;
import com.peeinn.domain.OrgVO;
import com.peeinn.domain.ProgramVO;
import com.peeinn.domain.SeatVO;
import com.peeinn.domain.TheaterVO;
import com.peeinn.domain.org.OrgResultVO;
import com.peeinn.domain.paging.CodeStateCriteria;
import com.peeinn.domain.paging.PageMaker;
import com.peeinn.service.MemberService;
import com.peeinn.service.OrgService;
import com.peeinn.service.ProgramService;
import com.peeinn.service.TheaterService;
import com.peeinn.util.MyUtils;
import com.peeinn.util.UploadFileUtils;

@Controller
@RequestMapping("/admin/intranet/")
public class IntranetController {
	
	private static final Logger logger = LoggerFactory.getLogger(IntranetController.class);
	@Resource(name="adminUploadPath") 
	private String adminUploadPath;
	@Autowired
	private MemberService memService;
	@Autowired
	private ProgramService pgService;
	@Autowired
	private TheaterService thService;
	@Autowired
	private OrgService orgService;

	
	/* ------------------- [ MEMBER MNG PART ] ------------------- */
	@RequestMapping(value="member", method=RequestMethod.GET)
	public void memberMng(Model model, CodeStateCriteria cri) {
		logger.info("------------ [memberMng GET] ------------");
		System.out.println("controller cri ->>>>>>" + cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(memService.totalCntByCode(cri));
		
		model.addAttribute("list", memService.searchList(cri));
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("cri", cri);
	}
	
	@ResponseBody
	@RequestMapping(value="searchList", method=RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> searchList(CodeStateCriteria cri){
		logger.info("------------ [stateList GET] ------------");
		ResponseEntity<Map<String, Object>> entity = null;
		System.out.println("cri ->>>>>>>>>" + cri);
		
		try {
			List<MemberVO> list = memService.searchList(cri);
			System.out.println("list ->>>>>>>>" + list);

			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(memService.totalCntByCode(cri));
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
	
	
	/* ------------------- [ PROGRAM MNG PART ] ------------------- */
	@RequestMapping(value="program/list", method=RequestMethod.GET)
	public void programMng(Model model) {
		logger.info("------------ [programMng GET] ------------");
		
		model.addAttribute("list", pgService.list());
	}

	@RequestMapping(value="program/regist", method=RequestMethod.GET)
	public String registPgGet(Model model) {
		logger.info("------------ [registPg GET] ------------");
		
		return "admin/intranet/program/input";
	}

	@RequestMapping(value="program/regist", method=RequestMethod.POST)
	public void registPgPost(ProgramVO program, MultipartFile imageFiles, HttpServletResponse response, HttpSession session) throws IOException {
		logger.info("------------ [registPg POST] ------------");
		ProgramVO pg = new ProgramVO();
		pg.setPgTitle(program.getPgTitle());
		pg.setPgTime(program.getPgTime());
		pg.setPgIsRunning(program.getPgIsRunning());
		pg.setPgDetail(program.getPgDetail());
		
		if(!imageFiles.isEmpty()) {
			logger.info(imageFiles.getOriginalFilename() + " / " + imageFiles.getSize());
			
			String thumbName = UploadFileUtils.uploadFile(adminUploadPath, 
														  "program",
														  imageFiles.getOriginalFilename(), 
														  imageFiles.getBytes());	
			String originName = UploadFileUtils.getOriginalFileName("program", thumbName);

		
			pg.setPgPoster(originName);
			pg.setPgThumb(thumbName);
		}
		
		pgService.regist(pg);
		response.sendRedirect("list");
	}
	
	@RequestMapping(value="program/modify", method=RequestMethod.GET)
	public String modifyGet(Model model, int pgNo) {
		logger.info("------------ [modify GET] ------------");
		
		ProgramVO pg = pgService.search(pgNo);
		
		model.addAttribute("pg", pg);
		
		return "admin/intranet/program/input";
	}

	@RequestMapping(value="program/modify", method=RequestMethod.POST)
	public void modifyPost(Model model, ProgramVO program, String delFiles, MultipartFile imageFiles, HttpServletResponse response) throws IOException {
		logger.info("------------ [modify POST] ------------");
		logger.info("삭제할 파일 ->>>" + delFiles);
		ProgramVO pg = new ProgramVO();
		pg.setPgNo(program.getPgNo());
		pg.setPgTitle(program.getPgTitle());
		pg.setPgTime(program.getPgTime());
		pg.setPgIsRunning(program.getPgIsRunning());
		pg.setPgDetail(program.getPgDetail());
		
		if(!imageFiles.isEmpty()) {
			logger.info(imageFiles.getOriginalFilename() + " / " + imageFiles.getSize());
			
			String thumbName = UploadFileUtils.uploadFile(adminUploadPath, 
														  "program",
														  imageFiles.getOriginalFilename(), 
														  imageFiles.getBytes());	
			String originName = UploadFileUtils.getOriginalFileName("program", thumbName);
			
			pg.setPgPoster(originName);
			pg.setPgThumb(thumbName);
		}
		
		//파일 삭제 
		if(delFiles != null) { //파일 삭제를 아무것도 안하면 null이 넘어오니까 예외처리 해줘야함
			UploadFileUtils.deleteFile(adminUploadPath, "program", delFiles);
		}
		
		pgService.modify(pg);
		
		response.sendRedirect("list");
	}
	
	@RequestMapping(value="program/remove", method=RequestMethod.GET)
	public void removePg(int pgNo, HttpServletResponse response) throws IOException {
		logger.info("------------ [remove POST] ------------");
		
		ProgramVO pg = pgService.search(pgNo);
		UploadFileUtils.deleteFile(adminUploadPath, "program", pg.getPgThumb());
		
		pgService.remove(pgNo);
		response.sendRedirect("list");
	}
	
	@RequestMapping(value="program/pgChoice", method=RequestMethod.GET)
	public void pgChoice(Model model) {
		logger.info("------------ [pgChoice GET] ------------");
		
		model.addAttribute("list", pgService.list());
	}
	
	/* ------------------- [ THEATER PART ] ------------------- */
	@RequestMapping(value="theater/list", method=RequestMethod.GET)
	public void thList(Model model) {
		logger.info("------------ [theaterList GET] ------------");
		
		model.addAttribute("list", thService.list());
	}
	
	@RequestMapping(value="theater/regist", method=RequestMethod.GET)
	public String thRegistGet() {
		logger.info("------------ [theaterRegist GET] ------------");
		
		return "admin/intranet/theater/input";
	}
	
	@ResponseBody
	@RequestMapping(value="theater/regist", method=RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> thRegistPost(TheaterVO th) {
		logger.info("------------ [theaterRegist POST] ------------");
		ResponseEntity<Map<String, Object>> entity = null;
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			thService.regist(th);
			map.put("result", "success");
			map.put("no", th.getThNo());
			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
			
		} catch (Exception e) {
			map.put("result", "fail");
			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		
		return entity;
	}
	
	/* ------------------- [ SEAT PART ] ------------------- */
	@RequestMapping(value="theater/seat", method=RequestMethod.GET)
	public void stRegistGet() {
		logger.info("------------ [seatRegist POST] ------------");
	}
	
	@ResponseBody
	@RequestMapping(value="theater/seat/regist", method=RequestMethod.POST)
	public ResponseEntity<String> stRegistPost(List<SeatVO> stList){
		logger.info("------------ [seatRegist POST] ------------");
		logger.info("stList ->>" + stList);
		
		ResponseEntity<String> entity = null;
		
		try {
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
			
		} catch (Exception e) {
			entity = new ResponseEntity<String>("fail", HttpStatus.OK);
		}
		
		return entity;
	}
	
	
	/* ------------------- [ ORGANIZATION PART ] ------------------- */
	@RequestMapping(value="org/list", method=RequestMethod.GET)
	public void orgList(Model model) {
		logger.info("------------ [orgList GET] ------------");
		
		model.addAttribute("list", orgService.orgByDateList(""));
	}
	
	@RequestMapping(value="org/regist", method=RequestMethod.GET)
	public String orgRegistGet(Model model, String tempDate, HttpSession session) throws ParseException {
		logger.info("------------ [orgLIst GET] ------------");
		OrgResultVO ores = new OrgResultVO();
		ores.getOrg().setOrgDate(MyUtils.parseStringToDate(tempDate));
		
		session.setAttribute("aTempDate", ores);
		System.out.println("세션 임시날짜값 입력완료");
		model.addAttribute("list", thService.list());
		
		return "admin/intranet/org/input";
	}
	
	@RequestMapping(value="org/regist", method=RequestMethod.POST)
	public void orgRegistPost(OrgVO org, String strDate, HttpServletResponse response) throws IOException, ParseException {
		logger.info("------------ [orgLIst POST] ------------");
		logger.info("controller org->>>>>>>>" + org);
		
		org.setOrgDate(MyUtils.parseStringToDate(strDate));
		orgService.regist(org);
		response.sendRedirect("list");
	}

	
	/* ------------------- [ SALES PART ] ------------------- */
	@RequestMapping(value="sales", method=RequestMethod.GET)
	public void salesMng() {
		logger.info("------------ [sales POST] ------------");
		
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
	
}//IntranetController
