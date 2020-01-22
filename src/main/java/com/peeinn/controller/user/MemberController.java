package com.peeinn.controller.user;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.peeinn.domain.AuthVO;
import com.peeinn.domain.MemberVO;
import com.peeinn.service.MemberService;
import com.peeinn.service.RsvService;
import com.peeinn.util.MyUtils;

@Controller
@RequestMapping("/user/member/")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Autowired
	MemberService service;
	@Autowired
	RsvService rsvService;
	
	/* ------------------- [ MEMBER PART ] ------------------- */
	
	//가입(화면)
	@RequestMapping(value="join", method=RequestMethod.GET)
	public String joinMemberGet() {
		logger.info("------------ [joinMember GET] ------------");
		
		return "user/member/inputForm";
	}

	//가입(처리)
	@RequestMapping(value="join", method=RequestMethod.POST)
	public String joinMemberPost(MemberVO mem, Model model) {
		logger.info("------------ [joinMember POST] ------------");
		logger.info("member ->>>>>>" + mem);
		service.regist(mem);
		
		model.addAttribute("title", "가입");
		return "redirect:/user/member/result";
	}
	
	//로그인(화면)
	@RequestMapping(value="login", method=RequestMethod.GET)
	public void loginGet() {
		logger.info("------------ [login GET] ------------");
	}
	
	//로그인(처리)
	@RequestMapping(value="loginPost", method=RequestMethod.POST)
	public void loginPost(Model model, HttpSession session, MemberVO mem) {
		logger.info("------------ [login POST] ------------");
		
		MemberVO dbMem = service.searchById(mem.getmId());
		
		if(dbMem == null) { //존재하지 않는 회원
			session.setAttribute("error", "아이디가 존재하지 않습니다");
		} else if(dbMem.getmQuitDate() != null) {
			session.setAttribute("error", "아이디가 존재하지 않습니다");
		} else {
			if(dbMem.getmPw().equals(mem.getmPw())) { //비밀번호 일치
				//로그인 성공
				//session 영역에 Auth키 만들어서 값 넣음
				session.setAttribute("Auth", new AuthVO(dbMem.getmNo(), dbMem.getmId(), dbMem.getmCode()));
				System.out.println("--- Auth 저장 완료 / User 로그인 성공 ---");
			} else {
				session.setAttribute("error", "비밀번호가 일치하지 않습니다");
			}
		}
	}
	
	//로그아웃
	@RequestMapping(value="logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		logger.info("------------ [loggout] ------------");
		session.removeAttribute("Auth");
		return "redirect:/";
	}
	
	//정보수정(화면)
	@RequestMapping(value="modify", method=RequestMethod.GET)
	public String modifyGet(Model model, HttpSession session) {
		logger.info("------------ [modify GET] ------------");
		AuthVO auth = (AuthVO) session.getAttribute("Auth");
		System.out.println("auth ->>>>>>>>>>>" + auth);
		int mNo = auth.getAuthNo();
		System.out.println("mNo ->>>>>>>>>>>" + mNo);
		model.addAttribute("mem", service.search(mNo));
		
		return "user/member/inputForm";
	}
	
	//정보수정(처리)
	@RequestMapping(value="modify", method=RequestMethod.POST)
	public String modifyPost(MemberVO mem) {
		logger.info("------------ [modify POST] ------------");
		
		service.modify(mem);
		
		return "redirect:/user/member/myPage";
	}
	
	//아이디 중복체크(데이터)
	@ResponseBody
	@RequestMapping(value="dupChk", method=RequestMethod.POST)
	public ResponseEntity<String> duplicateChk(String mId) {
		logger.info("---------- [duplicateChk] ----------");
		ResponseEntity<String> entity = null;
		
		try {
			MemberVO vo = service.searchById(mId);
			
			if(vo == null) {
				entity = new ResponseEntity<String>("available", HttpStatus.OK);
			} else {
				entity = new ResponseEntity<String>("duplicated", HttpStatus.OK);
			}
			
			
		} catch (Exception e) {
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_GATEWAY);
			e.printStackTrace();
		}
		
		return entity;
	}
	
	//탈퇴(화면)
	@RequestMapping(value="secess", method=RequestMethod.GET)
	public void secessGet() {
		logger.info("------------ [secess GET] ------------");
	}

	//탈퇴(처리)
	@RequestMapping(value="secess", method=RequestMethod.POST)
	public String secessPost(Model model, int mNo, String mPw, HttpSession session) throws IOException {
		logger.info("------------ [secess POST] ------------");
		
		MemberVO vo = service.search(mNo);
		
		if(vo.getmPw().equals(mPw)) {
			if(vo.getmQuitDate() == null) {
				service.secession(mNo);
				model.addAttribute("title", "탈퇴");
				session.removeAttribute("Auth");
				return "redirect:/user/member/result";
			}
			model.addAttribute("error", "진행중인 예약이 존재하여 탈퇴할 수 없습니다.");
		} else {
			model.addAttribute("error", "비밀번호가 일치하지 않습니다.");
		}
		return "user/member/secess";
	}
	
	//마이페이지
	@RequestMapping(value="myPage", method=RequestMethod.GET)
	public void myPage(Model model, HttpSession session) {
		logger.info("------------ [myPage GET] ------------");
		AuthVO auth = (AuthVO) session.getAttribute("Auth");
		int fDate = 1;
		model.addAttribute("list", rsvService.rsvListBymNo(auth.getAuthNo(), fDate));
	}
	
	//아이디 비밀번호 찾기 선택
	@RequestMapping(value="findInfo", method=RequestMethod.GET)
	public void findInfo() {
		logger.info("------------ [FIND INFO GET] ------------");
	}
	
	//찾기 폼
	@RequestMapping(value="findIdPw", method=RequestMethod.GET)
	public void findIdPwGet (Model model, String obj) {
		logger.info("------------ [FIND ID/PW GET] ------------");
		
		if(obj.equals("findPw")) {
			model.addAttribute("fPw", true);
		}
	}
	
	//찾기 프로세스
	@RequestMapping(value="findIdPw", method=RequestMethod.POST)
	public String findIdPwPost (Model model, MemberVO mem) {
		logger.info("------------ [FIND ID/PW POST] ------------");
		
		if(mem.getmId() == null) { //아이디찾기
			MemberVO dbMem = service.searchByMail(mem.getmMail());
			
			if(dbMem == null) {
				model.addAttribute("MailNotExist", true);
				return "user/member/findIdPw";
			}
			model.addAttribute("fObj", "ID");
			model.addAttribute("result", dbMem.getmId());
			
		} else { //비밀번호 찾기
			MemberVO dbMem = service.searchById(mem.getmId());
			
			if(dbMem == null) {
				model.addAttribute("fPw", true);
				model.addAttribute("IdNotExist", true);
				return "user/member/findIdPw";
				
			} else if(!dbMem.getmMail().equals(mem.getmMail())) {
				model.addAttribute("fPw", true);
				model.addAttribute("MailNotExist", true);
				return "user/member/findIdPw";
			}
			
			String tempPw = MyUtils.makeRandomPw(10);
			model.addAttribute("fObj", "PW");
			model.addAttribute("result", tempPw);
			dbMem.setmPw(tempPw);
			service.modifyPw(dbMem);
		}
		return "redirect:/user/member/result";
	}
	
	//결과(화면)
	@RequestMapping(value="result", method=RequestMethod.GET)
	public void result(@RequestParam(value="title", required=false, defaultValue="0") String title, 
					   @RequestParam(value="result", required=false, defaultValue="0") String result,
					   @RequestParam(value="fObj", required=false, defaultValue="0") String fObj,
					   Model model) {
		logger.info("------------ [result GET] ------------");
		logger.info("title ->> " + title);
		logger.info("result ->> " + result);
		logger.info("fObj ->> " + fObj);
		
		model.addAttribute("title", title);
		model.addAttribute("result", result);
		model.addAttribute("fObj", fObj);
	}
	
	
}//MemberController
