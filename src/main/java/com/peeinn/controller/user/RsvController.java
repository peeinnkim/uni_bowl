package com.peeinn.controller.user;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.peeinn.domain.AuthVO;
import com.peeinn.domain.MemberVO;
import com.peeinn.domain.OrgVO;
import com.peeinn.domain.PayVO;
import com.peeinn.domain.RsvVO;
import com.peeinn.domain.SeatVO;
import com.peeinn.domain.TheaterVO;
import com.peeinn.domain.org.OrgResultVO;
import com.peeinn.domain.org.RsvResultVO;
import com.peeinn.service.MemberService;
import com.peeinn.service.OrgService;
import com.peeinn.service.ProgramService;
import com.peeinn.service.RsvService;
import com.peeinn.service.SeatService;
import com.peeinn.service.TheaterService;

@Controller
@RequestMapping("/user/rsv/")
public class RsvController {

	private static final Logger logger = LoggerFactory.getLogger(RsvController.class);
	@Autowired
	private OrgService orgService;
	@Autowired
	private SeatService stService;
	@Autowired
	private MemberService memService;
	@Autowired
	private TheaterService thService;
	@Autowired
	private ProgramService pgService;
	@Autowired
	private RsvService rsvService;
	
	
	@RequestMapping(value="step01", method=RequestMethod.GET)
	public void registRsv1(Model model, String savedDate) {
		logger.info("------------ [RSV1 GET] ------------");
		
		if(savedDate == null) {
			savedDate = "";
		}
		
		model.addAttribute("sDate", savedDate);
		model.addAttribute("list", orgService.orgByDateList(savedDate));
	}
	
	@ResponseBody
	@RequestMapping(value="listByDate", method=RequestMethod.GET)
	public ResponseEntity<List<OrgResultVO>> listByDate(String sDate){
		logger.info("------------ [listByDate GET] ------------");
		ResponseEntity<List<OrgResultVO>> entity = null;
		
		try {
			List<OrgResultVO> list = orgService.orgByDateList(sDate);
			entity = new ResponseEntity<List<OrgResultVO>>(list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<OrgResultVO>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value="step01", method=RequestMethod.POST)
	public ResponseEntity<String> registRsv1(@RequestBody OrgVO tempOrg, HttpSession session) {
		logger.info("------------ [RSV1 POST] ------------");
		logger.info("OrgVO ->>>>" + tempOrg);
		session.removeAttribute("tempOres");
		System.out.println(">>세션 삭제 완료<<");
		ResponseEntity<String> entity = null;
		OrgResultVO ores = new OrgResultVO();
		ores.setOrg(tempOrg);
		ores.setPg(pgService.search(tempOrg.getOrgPgNo()));
		ores.setTh(thService.search(tempOrg.getOrgThNo()));
		
		try {
			session.setAttribute("tempOres", ores);
			System.out.println(">>세션 추가 완료<<");
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		return entity;
	}
	
	@RequestMapping(value="step02", method=RequestMethod.GET)
	public void registRsv2(Model model, HttpSession session) {
		logger.info("------------ [RSV2 GET] ------------");
		
		OrgResultVO tempOres = (OrgResultVO) session.getAttribute("tempOres");
		logger.info("RSV2 tempOres ->>" + tempOres);
		
		TheaterVO rowCol = thService.getRowAndCol(tempOres.getTh().getThNo());
		model.addAttribute("row", rowCol.getThRow());
		model.addAttribute("col", rowCol.getThCol());
		model.addAttribute("list", stService.listByThNo(tempOres.getTh().getThNo()));
	}
	
	@ResponseBody
	@RequestMapping(value="step02", method=RequestMethod.POST)
	public ResponseEntity<String> registRsv2(@RequestBody List<SeatVO> seatList, HttpSession session) {
		logger.info("------------ [RSV2 POST] ------------");
		ResponseEntity<String> entity = null;
		logger.info("seatList ->>" + seatList);
		
		try {
			session.setAttribute("seatList", seatList);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
			
		} catch (Exception e) {
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value="step03", method=RequestMethod.GET)
	public void registRsv3(Model model, int pr, HttpSession session) {
		logger.info("------------ [RSV3 GET] ------------");
		logger.info("pr ->>>" + pr);
		
		PayVO tempPay = new PayVO();
		tempPay.setPyPrice(pr);
		session.setAttribute("tempPay", tempPay);
		
		AuthVO auth = (AuthVO) session.getAttribute("Auth");
		model.addAttribute("mem", memService.search(auth.getAuthNo()));
	}
	
	@RequestMapping(value="step03", method=RequestMethod.POST)
	public String registRsv3(MemberVO mem, PayVO pay, HttpSession session) {
		logger.info("------------ [RSV3 POST] ------------");
		session.setAttribute("tempMem", mem);
		
		AuthVO auth = (AuthVO) session.getAttribute("Auth");
		OrgResultVO tempOres = (OrgResultVO) session.getAttribute("tempOres");
		List<SeatVO> seatList = (List<SeatVO>) session.getAttribute("seatList");
		PayVO py = (PayVO) session.getAttribute("tempPay");
		
		RsvVO rsv = new RsvVO();
		rsv.setRsvMemNo(auth.getAuthNo());
		rsv.setRsvOrgNo(tempOres.getOrg().getOrgNo());
		rsv.setRsvSeatList(seatList);
		logger.info("STEP03 rsv ->>>>" + rsv);
		
		pay.setPyPrice(py.getPyPrice());
		pay.setPyMemNo(auth.getAuthNo());
		logger.info("STEP03 pay ->>>>" + pay);
		
		try {
			int lastRsvNo = rsvService.registRsv(rsv, pay);

			return "redirect:/user/rsv/step04?no="+lastRsvNo;
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/error";
		}
	}
	
	@RequestMapping(value="step04", method=RequestMethod.GET)
	public void registRsv4(int no, Model model, HttpSession session) {
		logger.info("------------ [RSV4 GET] ------------");
		RsvResultVO rRes = rsvService.search(no);
		logger.info("rRes", rRes);
		model.addAttribute("rRes", rRes);
		
		//세션에 저장한 임시정보 삭제
		session.removeAttribute("tempMem");
		session.removeAttribute("tempPay");
		session.removeAttribute("seatList");
		session.removeAttribute("tempOres");
	}
	
	@RequestMapping(value="list", method=RequestMethod.GET)
	public void rsvList() {
		logger.info("------------ [rsvList GET] ------------");
	}
	
}//RsvController
