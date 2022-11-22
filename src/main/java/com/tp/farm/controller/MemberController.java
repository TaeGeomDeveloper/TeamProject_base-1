package com.tp.farm.controller;

import com.tp.farm.service.CsvService;
import com.tp.farm.service.MailService;
import com.tp.farm.service.MemberService;
import com.tp.farm.utils.NaverSensV2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.servlet.ModelAndView;
import com.tp.farm.dao.MemberDAO;
import com.tp.farm.vo.MemberVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Random;

@RestController("personController")
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private MailService mailService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private CsvService csvService;

	// 메인 페이지
	@RequestMapping(value = "/Main.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView Main(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("Main");
		return mav;
	}
	// 로그인
	@RequestMapping(value = "/Login.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView Login(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = this.getViewName(request);
		viewName= "/member/Login";
		mav.setViewName(viewName);
		csvService.insertDataTraditionalMarket();
		csvService.insertDataFarmlandPrice();
		csvService.insertCropData();
		return mav;
	}
	// 찾기
	@RequestMapping(value = "/Forgot.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView Forgot(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = this.getViewName(request);
		viewName= "/member/Forgot";
		mav.setViewName(viewName);
		return mav;
	}
	// 회원가입
	@RequestMapping(value = "/Register.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView Register(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = this.getViewName(request);
		viewName= "/member/Register";
		mav.setViewName(viewName);
		return mav;
	}
	// 회원가입 절차
	@RequestMapping(value = "/registProcess.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView registProcess(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();

		String mi_id = request.getParameter("mi_id");
		String mi_password = request.getParameter("mi_password");
		String mi_name = request.getParameter("mi_name");
		String[] mi_email = request.getParameterValues("mi_email");
		String email = mi_email[0] + mi_email[1];
		String[] mi_phone = request.getParameterValues("mi_phone");
		String[] mi_wireline = request.getParameterValues("mi_wireline");
		String phone =  mi_phone[0] + mi_phone[1] + mi_phone[2];
		String wireline = mi_wireline[0] + mi_wireline[1] + mi_wireline[2];
		String mi_address = request.getParameter("mi_address");
		String mi_addressDetail = request.getParameter("mi_addressDetail");
		String mi_addressCode = request.getParameter("mi_addressCode");
		String[] mi_regidentRegNumber = request.getParameterValues("mi_regidentRegNumber");
		String regidentRegNumber = mi_regidentRegNumber[0]+"-"+mi_regidentRegNumber[1];

		System.out.println(mi_addressDetail);

		MemberVO memberVO = new MemberVO(mi_id, mi_password, mi_name, email, phone,  wireline, mi_address, mi_addressDetail, mi_addressCode, regidentRegNumber, null);

		memberDAO.insertOneMember(memberVO);
		mav.setViewName("Main");
		return mav;
	}

	// 로그인 절차
	@RequestMapping(value="/loginProcess.do", method = {RequestMethod.POST, RequestMethod.GET})
	public ResponseEntity<String> loginProcess(@RequestParam("mi_id") String mi_id, @RequestParam("mi_password") String mi_password,
											   HttpServletRequest request, HttpServletResponse response, HttpSession httpSession) throws Exception {
												// HttpSession Bean 주입 -> session 영역에 접근 가능.
		boolean flag = false;
		MemberVO member = memberDAO.checkMember(mi_id, mi_password);
		if(member!=null){
			flag = true;
			request.getSession().setAttribute("user", member);	// session을 생성하면서 member OBJ를 user라는 이름으로 session 영역에 던져 놓음.
			boolean session = request.isRequestedSessionIdValid();
			System.out.println("login session : "+session);
			try{
				MemberVO mem = (MemberVO) httpSession.getAttribute("user");	// session 영역에서 원하는 데이터를 가져올 수 있게 된다.
				System.out.println(mem.getMi_id()+" 계정으로 접속되었습니다.");
			} catch(Exception e) {
				e.printStackTrace();
			}

		}

		System.out.println("로그인 회원 체크 : "+flag);
		return new ResponseEntity<String>(String.valueOf(flag),HttpStatus.OK);
	}

	// 로그아웃
	@RequestMapping(value="/Logout.do", method=RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request,
							   HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		request.getSession().invalidate();
		//String viewName = "redirect:/smartfarm/Main.do";
		mav.setViewName("Main");
		return mav;
	}
	//내 정보 버튼 클릭 시 해당 회원 개인정보 리스트 출력
	@RequestMapping(value = "/ReadInfo.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView readInfo(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		String mi_id = request.getParameter("mi_id");
		MemberVO member = memberDAO.selectOneMember(mi_id);
		mav.addObject("member",member);
		System.out.println(member);
		mav.setViewName("/member/ReadInfo");
		return mav;
	}
	// 회원 정보 수정
	@RequestMapping(value = "/UpdateMember.do", method = RequestMethod.POST)
	public ModelAndView UpdateMember(@ModelAttribute("info")MemberVO member, HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		memberDAO.updateOneMember(member);
		mav.addObject("member",member);
		System.out.println("memberID--->"+member.getMi_id());
		mav.setViewName("redirect:/member/ReadInfo.do?mi_id="+member.getMi_id()+"&mode=r");
		return mav;
	}
	// 회원 탈퇴
	@RequestMapping(value = "/deleteMember.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView deleteMember(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();

		String mi_id = request.getParameter("mi_id");
		System.out.println("memberID--->"+mi_id);
		memberDAO.deleteOneMember(mi_id);
//		mav.setViewName("redirect:/smartfarm/Main.do");
		request.getSession().invalidate();
		//String viewName = "redirect:/smartfarm/Main.do";
		mav.setViewName("Main");
		return mav;
	}
	// 회원 리스트
	@RequestMapping(value = "/MemberList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView memberList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = this.getViewName(request);
		List<MemberVO> list = memberDAO.selectAllMemeber();
		mav.addObject("list",list);
		mav.setViewName("List");
		return mav;
	}
	// 비빌번호 찾기
	@RequestMapping(value = "/findPwd.do", method = {RequestMethod.POST, RequestMethod.GET})
	public ResponseEntity<String> findPwd(HttpServletRequest request, HttpServletResponse response) throws Exception{
		boolean flag = false;
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String mi_id = request.getParameter("mi_id");
		String mi_email = request.getParameter("mi_email");
		System.out.println("mi_id : "+mi_id);
		System.out.println("mi_email : "+mi_email);
		MemberVO member = memberDAO.findPwd(mi_id,mi_email);
		if(member!=null){
			flag = true;
			String mi_password = member.getMi_password();
			System.out.println(mi_password+"find pwd success");
			mailService.sendMail(mi_email,"smartfarm find password",mi_id+" password is"+mi_password+".");
		}
		System.out.println("findPwd status --->"+flag);
		return new ResponseEntity<String>(String.valueOf(flag),HttpStatus.OK);
	}

	// 아이디 찾기
	@RequestMapping(value = "/findId.do", method = {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public String findId(HttpServletRequest request, HttpServletResponse response) throws  Exception{
		String mi_name = request.getParameter("mi_name");
		String mi_phone = request.getParameter("mi_phone");
		System.out.println("mi_name : "+mi_name);
		System.out.println("mi_phone : "+mi_phone);
		String result = memberService.findId(mi_name, mi_phone);
		System.out.println(result);
		return result;
	}

	// 아이디 체크
	@RequestMapping(value = "/idCheck.do", method = RequestMethod.GET)
	public ResponseEntity<String> idCheck(@RequestParam("mi_id") String mi_id){
		boolean flag = false;
		System.out.println("idCheck : "+mi_id);
		flag = memberService.isMemberId(mi_id);
		if(mi_id==""){
			flag = true;
		}
		return new ResponseEntity<String>(String.valueOf(flag), HttpStatus.OK);
	}

	// 문자 전송
	@RequestMapping(value = "/sendSMS.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String sendSMS(String to){
		//String [] mi_phone = request.getParameterValues("mi_phone");
		//String phone = mi_phone[0]+mi_phone[1]+mi_phone[2];
		NaverSensV2 message = new NaverSensV2();
		Random rand = new Random();
		String numStr = "";
		for (int i = 0; i < 6; i++) {
			String ran = Integer.toString(rand.nextInt(10));
			numStr += ran;
		}
		System.out.println("회원가입 문자 인증 => " + numStr);
		message.sendSMS(to, numStr);
		return numStr;
	}

	// View 처리
	private String getViewName(HttpServletRequest request) throws Exception {
		String contextPath = request.getContextPath();
		String uri = (String) request.getAttribute("javax.servlet.include.request_uri");
		if (uri == null || uri.trim().equals("")) {
			uri = request.getRequestURI();
		}

		
		int begin = 0; //
		if (!((contextPath == null) || ("".equals(contextPath)))) {
			begin = contextPath.length(); 
		}

		int end;
		if (uri.indexOf(";") != -1) {
			end = uri.indexOf(";");
		} else if (uri.indexOf("?") != -1) {
			end = uri.indexOf("?"); 
		} else {
			end = uri.length();
		}


		String fileName = uri.substring(begin, end);
		if (fileName.indexOf(".") != -1) {
			fileName = fileName.substring(0, fileName.lastIndexOf(".")); 
		}
		if (fileName.lastIndexOf("/") != -1) {
			fileName = fileName.substring(fileName.lastIndexOf("/"));
		}
		return fileName;
	}
	
}
