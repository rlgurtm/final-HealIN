package org.kosta.healthin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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
	
	@RequestMapping(value="mypage/user_calendar.do", produces = "application/json")
	public String userCalendar(Model model, HttpServletRequest request) {
		System.out.println("user_calendar.do");
		return "mypage/user_calendar.tiles";
	}
	
	@RequestMapping("mypage/ajaxCalendar.do")
	@ResponseBody
	public ArrayList<HashMap<String, Object>> ajaxCalendar(Model model, HttpServletRequest request) {
		System.out.println("ajaxCalendar.do");
		HashMap<String, Object> jsonObject = null;
	    ArrayList<HashMap<String, Object>> jsonList = new ArrayList<HashMap<String, Object>>();
	    
	    String id = request.getParameter("id");
	    List<String> dateList = calendarService.getAllDateIntakeFood(id);
	    
	    HashMap<String, String> map = new HashMap<String, String>();
	    
	    
	    for (int i=0; i<dateList.size(); i++) {
	    	jsonObject = new HashMap<String, Object>();
	    	jsonObject.put("title", "총섭취량");
	    	jsonObject.put("date", dateList.get(i));
	    	jsonList.add(jsonObject);
	    }
	         
	   /* //1번째 데이터
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
	    jsonList.add(jsonSubObject);*/
	         
//	    jsonObject.put("success", true);
//	    jsonObject.put("total_count", 10);
//	    jsonObject.put("result_list", jsonList);

//		model.addAttribute("jsonList", jsonList);
		return jsonList;
	}
	
	@RequestMapping("mypage/update_calendar.do")
	public String updateCalendar(Model model, HttpServletRequest request) {
		String type = request.getParameter("type");
		System.out.println(request.getParameter("param"));
		System.out.println(type);
		return "reply";
	}
}
