package org.kosta.healthin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.healthin.model.dao.CalendarDAO;
import org.kosta.healthin.model.service.CalendarService;
import org.kosta.healthin.model.vo.VO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CalendarController {
	@Resource
	private CalendarService calendarService;
	@Resource
	private CalendarDAO calendarDAO;
	
	@RequestMapping(value="userCalendar.do", produces = "application/json")
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
	
	@RequestMapping("intakeCalorie.do")
	public String intakeCalorie(Model model, HttpServletRequest request) {
		String date = request.getParameter("date");
		String id = request.getParameter("id");
		HashMap<String, String> map = new HashMap<String, String>();	// id와 date 정보를 저장하는 map
		map.put("id", id);
		map.put("date", date);
		
		List<VO> foodList = calendarService.getAllIntakeFood(map);			// 음식 리스트
		List<String> foodCategory = calendarService.getAllFoodCategory();	// 음식 카테고리 리스트
		int totalCalorie = calendarDAO.getTotalIntakeCalorieOfDay(map);	// 각 일 별 총 섭취 칼로리
		model.addAttribute("foodList", foodList);
		model.addAttribute("foodCategory", foodCategory);
		model.addAttribute("date", date);
		model.addAttribute("totalCalorie", totalCalorie);
		return "mypage/user_intake_calorie.tiles";
	}
	
	@RequestMapping("consumptionCalorie.do")
	public String consumptionCalorie(Model model, HttpServletRequest request) {
		return "mypage/user_consumption_calorie.tiles";
	}
	
	@RequestMapping("getFoodsByCategory.do")
	@ResponseBody
	public List<String> getFoodsByCategory(Model model, HttpServletRequest request) {
		String foodCategory = request.getParameter("foodCategory");
		List<String> foodList = calendarService.getFoodsByCategory(foodCategory);
		return foodList;
	}
	
	@RequestMapping("deleteFood.do")
	public String deleteFood(Model model, HttpServletRequest request) {
		int intakeNo = Integer.parseInt(request.getParameter("intakeNo"));
		String id = request.getParameter("id");
		String date = request.getParameter("date");
		calendarService.deleteFood(intakeNo);
		return "redirect:intakeCalorie.do?id=" + id + "&date=" + date;
	}
	
	@RequestMapping("insertFood.do")
	public String insertFood(Model model, HttpServletRequest request) {
		String id = request.getParameter("id");
		String date = request.getParameter("date");
		String foodName = request.getParameter("foodName");
		int count = Integer.parseInt(request.getParameter("count"));
		HashMap<String, Object> foodMap = new HashMap<String, Object>();
		foodMap.put("id", id);
		foodMap.put("foodName", foodName);
		foodMap.put("date", date);
		foodMap.put("count", count);
		calendarService.insertFood(foodMap);
		return "redirect:intakeCalorie.do?id=" + id + "&date=" + date;
	}
	
	/*@RequestMapping("updateCalendar.do")
	public String updateCalendar(Model model, HttpServletRequest request) {
		String type = request.getParameter("type");
		System.out.println(request.getParameter("param"));
		System.out.println(type);
		return "reply";
	}*/
}
