package com.peeinn.controller.admin;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.peeinn.domain.AuthVO;
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
import com.peeinn.service.QnAService;
import com.peeinn.service.RsvService;
import com.peeinn.service.SeatService;
import com.peeinn.service.TheaterService;
import com.peeinn.util.UploadFileUtils;

@Controller
@RequestMapping("/admin/")
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
	@Autowired
	private SeatService stService;
	@Autowired
	private RsvService rsvService;
	@Autowired
	private QnAService qnaService;

	
	/* ------------------- [ MEMBER MNG PART ] ------------------- */
	@RequestMapping(value="gnr/member", method=RequestMethod.GET)
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
		
		return "admin/program/input";
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
		
		return "admin/program/input";
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
		
		return "admin/theater/input";
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
	
	@RequestMapping(value="theater/modifyRowAndCol", method = RequestMethod.GET)
	public String modifyRowAndCol(int row, int col, int thNo) {
		logger.info("------------ [modifyRowAndCol GET] ------------");
		
		TheaterVO th = new TheaterVO();
		th.setThNo(thNo);
		th.setThRow(row);
		th.setThCol(col);
		
		thService.modifyRowAndCol(th);
		
		return "redirect:/admin/theater/list";
	}

	@RequestMapping(value="theater/modify", method=RequestMethod.GET)
	public String modifyTh(Model model, int thNo) {
		logger.info("------------ [modifyTh GET] ------------");
		
		if(thService.hasRsvedSt(thNo) > 0) {
			model.addAttribute("hasRsvedSt", true);
			return "admin/theater/list";
		}
		model.addAttribute("th", thService.search(thNo));
		return "admin/theater/input";
	}
	
	@ResponseBody
	@RequestMapping(value="theater/modify/{stMod}", method=RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> modifyThPost(TheaterVO th, @PathVariable int stMod) {
		logger.info("------------ [theaterRegist POST] ------------");
		logger.info("stMod ->>" + stMod);
		ResponseEntity<Map<String, Object>> entity = null;
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			thService.modify(th);
			if(stMod == 0) {
				map.put("result", "success");
				entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
			} else {
				map.put("result", "needStMod");
				map.put("no", th.getThNo());
				entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
			}
			
		} catch (Exception e) {
			map.put("result", "fail");
			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		return entity;
	}	
	
	@RequestMapping(value="theater/remove", method = RequestMethod.GET)
	public String removeTh(Model model, int thNo) {
		logger.info("------------ [removeTh GET] ------------");
		
		if(thService.hasRsvedSt(thNo) > 0) {
			model.addAttribute("hasRsvedSt", true);
			return "admin/theater/list";
		}
		thService.remove(thNo);
		return "redirect:/admin/theater/list";
	}
	

	/* ------------------- [ SEAT PART ] ------------------- */
	@RequestMapping(value="theater/seat", method=RequestMethod.GET)
	public String stRegistGet(Model model, int thNo) {
		logger.info("------------ [seatRegist GET] ------------");
		
		List<SeatVO> list = stService.listByThNo(thNo);
		
		if(list != null) {
			TheaterVO rowCol = thService.getRowAndCol(thNo);
			model.addAttribute("row", rowCol.getThRow());
			model.addAttribute("col", rowCol.getThCol());
			model.addAttribute("list", list);
		}
		
		model.addAttribute("th", thService.search(thNo));
		return "admin/theater/seatInput";
	}
	
	@ResponseBody
	@RequestMapping(value="theater/seat/regist", method=RequestMethod.POST)
	public ResponseEntity<String> stRegistPost(@RequestBody List<SeatVO> stList) {
		logger.info("------------ [seatRegist POST] ------------");
		logger.info("stList ->>>>>" + stList.size());
		logger.info("stList ->>>>>" + stList);
		ResponseEntity<String> entity = null;
		
		try {
			stService.regist(stList); 
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value="theater/seat/modify/{modType}", method=RequestMethod.POST)
	public ResponseEntity<String> stModifyThPost(@RequestBody List<SeatVO> stList, @PathVariable int modType) {
		logger.info("------------ [theaterRegist POST] ------------");
		logger.info("modType ->>" + modType);
		ResponseEntity<String> entity = null;
		
		try {
			if(modType == 0) {
				stService.modify(stList);
				entity = new ResponseEntity<String>("success", HttpStatus.OK);
			} else {
				stService.modifyAll(modType, stList);
				entity = new ResponseEntity<String>("success", HttpStatus.OK);
			}
		} catch (Exception e) {
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		return entity;
	}	
	
	@RequestMapping(value="theater/seat/modify/success", method=RequestMethod.GET)
	public String stModifySuccess () {
		logger.info("------------ [stModifySuccess GET] ------------");
		return "redirect:/admin/theater/list";
	}
	
	
	/* ------------------- [ ORGANIZATION PART ] ------------------- */
	@RequestMapping(value="org/list", method=RequestMethod.GET)
	public void orgList(Model model) {
		logger.info("------------ [orgList GET] ------------");
		
		model.addAttribute("thList", thService.list());
	}
	
	@ResponseBody
	@RequestMapping(value="org/listByDate", method=RequestMethod.GET)
	public ResponseEntity<List<OrgResultVO>> listByDate(String sDate, int orgThNo){
		logger.info("------------ [listByDate GET] ------------");
		ResponseEntity<List<OrgResultVO>> entity = null;
		
		try {
			List<OrgResultVO> list = orgService.orgByDateList(sDate, orgThNo);
			entity = new ResponseEntity<List<OrgResultVO>>(list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<OrgResultVO>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value="org/regist", method=RequestMethod.POST)
	public ResponseEntity<String> orgRegistPost(@RequestBody OrgVO org) {
		logger.info("------------ [orgLIst POST] ------------");
		logger.info("controller org->>>>>>>>" + org);
		ResponseEntity<String> entity = null;
		
		try {
			orgService.regist(org);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@ResponseBody
	@RequestMapping(value="org/modify", method=RequestMethod.POST)
	public ResponseEntity<String> orgModifyPost(@RequestBody OrgVO org) {
		logger.info("------------ [orgLIst POST] ------------");
		logger.info("controller org->>>>>>>>" + org);
		ResponseEntity<String> entity = null;
		
		try {
			orgService.modify(org);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value="org/remove", method=RequestMethod.GET)
	public String orgRemoveGet(Model model, int orgNo) {
		logger.info("------------ [orgLIst POST] ------------");
		
		if(orgService.isRsved(orgNo) > 0) {
			model.addAttribute("hasRsvedSt", true);
			return "admin/org/list";
		}
		orgService.remove(orgNo);
		return "redirect:/admin/org/list";
	}
	
	/* ------------------- [ RSV PART ] ------------------- */
	@RequestMapping(value="gnr/rsv", method=RequestMethod.GET)
	public void rsvMng(Model model) {
		logger.info("------------ [RSVMng POST] ------------");
		
		model.addAttribute("list", rsvService.rsvLogsBymNo(0));
	}
	
	
	
	/* ------------------- [ SALES PART ] ------------------- */
	@RequestMapping(value="gnr/sales", method=RequestMethod.GET)
	public void salesMng() {
		logger.info("------------ [sales POST] ------------");
		
	}

	/* ------------------- [ MEMBER PART ] ------------------- */
	@RequestMapping(value="member/join", method=RequestMethod.GET)
	public String adminJoinGet() {
		logger.info("------------ [adminJoin GET] ------------");
		
		return "admin/member/inputForm";
	}
	
	@RequestMapping(value="member/join", method=RequestMethod.POST)
	public String adminJoinPost(Model model, MemberVO mem) {
		logger.info("------------ [adminJoin POST] ------------");
		
		memService.regist(mem);
		model.addAttribute("title", "가입");
		
		return "redirect:/admin/member/login";
	}
	
	@RequestMapping(value="member/login", method=RequestMethod.GET)
	public void adminLoginGet() {
		logger.info("------------ [adminLogin GET] ------------");
		
	}

	@RequestMapping(value="member/login", method=RequestMethod.POST)
	public String adminLoginPost(Model model, HttpSession session, MemberVO mem) {
		logger.info("------------ [adminLogin POST] ------------");
		MemberVO dbMem = memService.searchById(mem.getmId());
		
		if(dbMem == null) { //존재하지 않는 회원
			model.addAttribute("error", "아이디가 존재하지 않습니다");
		} else if(dbMem.getmQuitDate() != null) {
			model.addAttribute("error", "아이디가 존재하지 않습니다");
		} else {
			if(dbMem.getmPw().equals(mem.getmPw())) { //비밀번호 일치
				//로그인 성공
				//session 영역에 Auth키 만들어서 값 넣음
				session.setAttribute("Auth", new AuthVO(dbMem.getmNo(), dbMem.getmId(), dbMem.getmCode()));
				logger.info("--- Auth 저장 완료 / Admin 로그인 성공 ---");
				return "redirect:/admin/gnrsales";
			} else {
				model.addAttribute("error", "비밀번호가 일치하지 않습니다");
			}
		}
		return "admin/member/login";
	}
	
	
	/* ------------------- [ REQUEST PART ] ------------------- */
	@RequestMapping(value="gnr/req", method=RequestMethod.GET)
	public void reqMngGet () {
		logger.info("------------ [adminLogin GET] ------------");
		
	}

	@ResponseBody
	@RequestMapping(value="gnr/getReqData", method=RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> reqData () {
		logger.info("------------ [reqData POST] ------------");
		ResponseEntity<Map<String, Object>> entity = null;
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			List<Integer> list = qnaService.listCateCnt();
			map.put("list", list);
			map.put("result", "success");
			entity = new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			map.put("result", "fail");
			entity = new ResponseEntity<Map<String,Object>>(map, HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
}//IntranetController
