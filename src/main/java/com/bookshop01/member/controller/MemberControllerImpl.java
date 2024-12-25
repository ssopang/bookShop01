package com.bookshop01.member.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bookshop01.common.base.BaseController;
import com.bookshop01.member.service.MemberService;
import com.bookshop01.member.vo.MemberVO;

@Controller("memberController")
@RequestMapping(value="/member")
public class MemberControllerImpl extends BaseController implements MemberController{
	@Autowired
	private MemberService memberService;
	@Autowired
	private MemberVO memberVO;
	
	@Override
	@RequestMapping(value="/login.do" ,method = RequestMethod.POST)
	public ModelAndView login(@RequestParam Map<String, String> loginMap,
			                  HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		 memberVO=memberService.login(loginMap);
		if(memberVO!= null && memberVO.getMember_id()!=null){
			HttpSession session=request.getSession();
			session=request.getSession();
			session.setAttribute("isLogOn", true);
			session.setAttribute("memberInfo",memberVO);
	        session.setAttribute("member_id", memberVO.getMember_id());
			
			String action=(String)session.getAttribute("action");
			if(action!=null && action.equals("/order/orderEachGoods.do")){
				mav.setViewName("forward:"+action);
			}else{
				mav.setViewName("redirect:/main/main.do");	
			}
			
			
			
		}else{
			String message="���̵�  ��й�ȣ�� Ʋ���ϴ�. �ٽ� �α������ּ���";
			mav.addObject("message", message);
			mav.setViewName("/member/loginForm");
		}
		return mav;
	}
	
	@Override
	@RequestMapping(value="/logout.do" ,method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session=request.getSession();
		session.setAttribute("isLogOn", false);
		session.removeAttribute("memberInfo");
		mav.setViewName("redirect:/main/main.do");
		return mav;
	}
	
	@Override
	@RequestMapping(value="/addMember.do" ,method = RequestMethod.POST)
	public ResponseEntity addMember(@ModelAttribute("memberVO") MemberVO _memberVO,
			                HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
		    memberService.addMember(_memberVO);
		    message  = "<script>";
		    message +=" alert('ȸ�� ������ ���ƽ��ϴ�.�α���â���� �̵��մϴ�.');";
		    message += " location.href='"+request.getContextPath()+"/member/loginForm.do';";
		    message += " </script>";
		    
		}catch(Exception e) {
			message  = "<script>";
		    message +=" alert('�۾� �� ������ �߻��߽��ϴ�. �ٽ� �õ��� �ּ���');";
		    message += " location.href='"+request.getContextPath()+"/member/memberForm.do';";
		    message += " </script>";
			e.printStackTrace();
		}
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	@Override
	@RequestMapping(value="/overlapped.do" ,method = RequestMethod.POST)
	public ResponseEntity overlapped(@RequestParam("id") String id,HttpServletRequest request, HttpServletResponse response) throws Exception{
		ResponseEntity resEntity = null;
		String result = memberService.overlapped(id);
		resEntity = new ResponseEntity(result, HttpStatus.OK);
		return resEntity;
	}
	
	@Override
	@RequestMapping(value="/removeMember.do", method = RequestMethod.POST)
	public ModelAndView removeMember(@ModelAttribute("member") MemberVO member,
										HttpServletRequest request, HttpServletResponse response) throws Exception {
	    int result = memberService.removeMember(member); 	  
	    HttpSession session=request.getSession();
	    session.setAttribute("isLogOn", false);
		session.removeAttribute("memberInfo");
	    ModelAndView mav = new ModelAndView("redirect:/main/main.do");
	    return mav;
	}
	
	@Override
	@RequestMapping(value="/addAddress.do", method = RequestMethod.POST)
	public ModelAndView addAddress(@RequestParam Map<String, String> addMap,
	                                HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");
		addMap.put("member_id", member_id);
	    memberService.addAddress(addMap);
	    ModelAndView mav = new ModelAndView("redirect:/main/main.do");
	    return mav;
	}
	
    @Override
    @RequestMapping(value="/myAddresses.do", method=RequestMethod.GET)
    public ModelAndView getAddressList(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // 세션에서 로그인한 사용자의 ID를 가져옴
        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("member_id");

        // 기본 주소 및 추가 주소 리스트 가져오기
        MemberVO defaultAddress = memberService.getDefaultAddress(id);
        List<Map<String, String>> additionalAddresses = memberService.getAdditionalAddresses(id);

        // 뷰에 전달할 데이터 설정
        ModelAndView mav = new ModelAndView("/member/myAddresses");
        mav.addObject("defaultAddress", defaultAddress);
        mav.addObject("additionalAddresses", additionalAddresses);
        return mav;
    }

}
