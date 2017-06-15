package org.kosta.healthin.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.healthin.model.service.PaymentStatusService;
import org.kosta.healthin.model.vo.ListVO;
import org.kosta.healthin.model.vo.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PaymentStatusController {
	@Resource
	private PaymentStatusService paymentStatusService;
	
	@RequestMapping("userPaymentList.do")
	public String userPaymentList(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session != null){
			MemberVO mvo = (MemberVO) session.getAttribute("mvo");
			String id = mvo.getId();
			String nowPage = request.getParameter("pageNo");
			List<String> ratedTrainerList = paymentStatusService.isExistRating(id);
			System.out.println(ratedTrainerList);
			ListVO paymentList = paymentStatusService.getPaymentList(id, nowPage);
			for (int i=0; i<paymentList.getLVO().size(); i++) {
				System.out.println(paymentList.getLVO().get(i));
			}
			model.addAttribute("paymentList", paymentList);
			model.addAttribute("ratedTrainerList", ratedTrainerList);
			return "payment/user_payment_list.tiles";
		} else {
			return "redirect:home.do"; 
		}
	}
	@RequestMapping("trainerPaymentList.do")
	public String trainerPaymentList(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session != null){
			MemberVO mvo = (MemberVO) session.getAttribute("mvo");
			String id = mvo.getId();
			String nowPage = request.getParameter("pageNo");
			
			ListVO paymentList = paymentStatusService.getUsersPaymentList(id, nowPage);
			model.addAttribute("paymentList", paymentList);
			return "payment/trainer_payment_list.tiles";
		} else {
			return "redirect:home.do"; 
		}
	}
	@RequestMapping("updateUserPayStatus.do")
	public String updateUserPayStatus(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session != null){
			MemberVO mvo = (MemberVO) session.getAttribute("mvo");
			String userId = request.getParameter("userId");
			String trainerId = request.getParameter("trainerId");
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("userId", userId);
			map.put("trainerId", trainerId);
			paymentStatusService.updateUserPayStatus(map);
			return "redirect:userPaymentList.do";
		} else {
			return "redirect:home.do"; 
		}
	}
	
	@RequestMapping("rating.do")
	public String rating(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session != null){
			//MemberVO mvo = (MemberVO) session.getAttribute("mvo");
			String userId = request.getParameter("userId");
			String trainerId = request.getParameter("trainerId");
			double rate = Double.parseDouble(request.getParameter("rate"));
			String content = request.getParameter("content");
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("userId", userId);
			map.put("trainerId", trainerId);
			map.put("rate", rate);
			map.put("content", content);
			paymentStatusService.rating(map);
			return "redirect:userPaymentList.do";
		} else {
			return "redirect:home.do"; 
		}
	}
//	@RequestMapping("ajaxForRating.do")
//	@ResponseBody
//	public ArrayList<HashMap<String, Object>> ajaxCalendar(Model model, HttpServletRequest request) {
//		String id = request.getParameter("id");	// 세션으로부터 유저의 아이디를 받아옴
//		// 달력에 각 일별로 총 섭취한 칼로리량을 나타내기 위한 ArrayList
//		ArrayList<HashMap<String, Object>> intakeList = calendarService.getIntakeCalorieForMonth(id);
//		// 달력에 각 일별로 총 소비한 칼로리량을 나타내기 위한 ArrayList
//		ArrayList<HashMap<String, Object>> consumptionList = calendarService.getConsumptionCalorieForMonth(id);
//		// json 타입으로 변환되어 리턴될 리스트 (칼로리 총 섭취량/소비량을 가짐)
//		ArrayList<HashMap<String, Object>> eventList = new ArrayList<HashMap<String, Object>>();
//		for (int i=0; i<intakeList.size(); i++) {
//			eventList.add(intakeList.get(i));
//		}
//		for (int i=0; i<consumptionList.size(); i++) {
//			eventList.add(consumptionList.get(i));
//		}
//		return eventList;
//		return null;
//	}
}
