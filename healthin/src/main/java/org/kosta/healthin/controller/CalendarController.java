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
	
	@RequestMapping("mypage/user_calendar.do")
	public String userCalendar(Model model, HttpServletRequest request) {
		System.out.println("user_calendar.do");
		HashMap<String, Object> jsonObject = new HashMap<String, Object>();
		HashMap<String, Object> jsonSubObject = null;
	    ArrayList<HashMap<String, Object>> jsonList = new ArrayList<HashMap<String, Object>>();
	         
	    //1번째 데이터
	    jsonSubObject = new HashMap<String, Object>();
	    jsonSubObject.put("title", "아오아오");
	    jsonSubObject.put("date", "2017-05-07");
	    jsonList.add(jsonSubObject);
	    //2번째 데이터
	    jsonSubObject = new HashMap<String, Object>();
	    jsonSubObject.put("title", "ㅋㅋㅋ");
	    jsonSubObject.put("date", "2017-05-07");
	    jsonList.add(jsonSubObject);
	    //3번째 데이터
	    jsonSubObject = new HashMap<String, Object>();
	    jsonSubObject.put("title", "ㅎㅎㅎ");
	    jsonSubObject.put("date", "2017-05-25");
	    jsonList.add(jsonSubObject);
	         
	    jsonObject.put("success", true);
	    jsonObject.put("total_count", 10);
	    jsonObject.put("result_list", jsonList);

	    System.out.println(jsonList);
		model.addAttribute("jsonList", jsonList);
		return "mypage/user_calendar.tiles";
	}
	
	@RequestMapping("mypage/update_calendar.do")
	@ResponseBody
	public String updateCalendar(Model model, HttpServletRequest request) {
		String type = request.getParameter("type");
		System.out.println(request.getParameter("param"));
		System.out.println(type);
		return "reply";
	}
}
