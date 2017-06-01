package org.kosta.healthin.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.healthin.model.service.CalendarService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CalendarController {
	@Resource
	private CalendarService calendarService;
	
	@RequestMapping(value="user_calendar.do", produces = "application/json")
	public String userCalendar(Model model, HttpServletRequest request) {
		return "mypage/user_calendar.tiles";
	}
	
	@RequestMapping("ajaxCalendar.do")
	@ResponseBody
	public ArrayList<HashMap<String, Object>> ajaxCalendar(Model model, HttpServletRequest request) {
		String id = request.getParameter("id");	// 세션으로부터 유저의 아이디를 받아옴
		// 달력에 각 일별로 총 섭취한 칼로리량을 나타내기 위한 ArrayList
		ArrayList<HashMap<String, Object>> intakeList = calendarService.getIntakeCalorieForMonth(id);
		// 달력에 각 일별로 총 소비한 칼로리량을 나타내기 위한 ArrayList
		ArrayList<HashMap<String, Object>> consumptionList = calendarService.getConsumptionCalorieForMonth(id);
		// json 타입으로 변환되어 리턴될 리스트 (칼로리 총 섭취량/소비량을 가짐)
		ArrayList<HashMap<String, Object>> eventList = new ArrayList<HashMap<String, Object>>();
		for (int i=0; i<intakeList.size(); i++) {
			eventList.add(intakeList.get(i));
		}
		for (int i=0; i<consumptionList.size(); i++) {
			eventList.add(consumptionList.get(i));
		}
		return eventList;
	}
	
	@RequestMapping("update_calendar.do")
	public String updateCalendar(Model model, HttpServletRequest request) {
		String type = request.getParameter("type");
		System.out.println(request.getParameter("param"));
		System.out.println(type);
		return "reply";
	}
}
