package org.kosta.healthin.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserHealthController {
//	@Resource
//	private CalendarService calendarService;
	
	@RequestMapping("user_health_check.do")
	public String userCalendar(Model model, HttpServletRequest request) {
		return "mypage/user_health_check.tiles";
	}
}
