package org.kosta.healthin.controller;

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
	
	@RequestMapping("paymentList.do")
	public String paymentList(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session != null){
			MemberVO mvo = (MemberVO) session.getAttribute("mvo");
			String id = mvo.getId();
			String nowPage = request.getParameter("pageNo");
			ListVO paymentList = paymentStatusService.getPaymentList(id, nowPage);
			model.addAttribute("paymentList", paymentList);
			return "payment/payment_list.tiles";
		} else {
			return "redirect:home.do"; 
		}
	}
}
