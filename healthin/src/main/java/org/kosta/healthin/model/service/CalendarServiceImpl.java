package org.kosta.healthin.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.healthin.model.dao.CalendarDAO;
import org.springframework.stereotype.Service;

@Service
public class CalendarServiceImpl implements CalendarService {
	@Resource
	private CalendarDAO calendarDAO;

	@Override
	public ArrayList<HashMap<String, Object>> getIntakeCalorieForMonth(String id) {
		// 달력에 출력될 정보를 가진 Object를 저장할 map
		HashMap<String, Object> eventObject = null;	
		// 유저의 id와 각 날짜를 저장할 map
		HashMap<String, String> map = null;				
		// 하루 동안 총 섭취한 칼로리 양을 저장하는 ArrayList
		ArrayList<Integer> calorieList = new ArrayList<Integer>();
		// Controller로 리턴될 섭취 칼로리 리스트
	    ArrayList<HashMap<String, Object>> intakeList = new ArrayList<HashMap<String, Object>>();	
	    
	    // 음식을 섭취한 날짜들을 받아옴
	    List<String> dateList = calendarDAO.getAllDateIntakeCalorie(id);	
	    
	    // 일일 칼로리 총 섭취량을 구하기 위한 반복문들
	    for (int i=0; i<dateList.size(); i++) {
	    	map = new HashMap<String, String>();
	    	map.put("id", id);
	    	map.put("date", dateList.get(i));
	    	int calorieOfDay = calendarDAO.getTotalIntakeCalorieOfDay(map);
	    	calorieList.add(calorieOfDay);
	    }
	    for (int i=0; i<dateList.size(); i++) {
	    	eventObject = new HashMap<String, Object>();
	    	eventObject.put("title", "총섭취량 : " + calorieList.get(i));
	    	eventObject.put("start", dateList.get(i));
	    	eventObject.put("url", "user_calendar.do");
	    	intakeList.add(eventObject);
	    }
		return intakeList;
	}

	@Override
	public ArrayList<HashMap<String, Object>> getConsumptionCalorieForMonth(String id) {
		// 달력에 출력될 정보를 가진 Object를 저장할 map
		HashMap<String, Object> eventObject = null;	
		// 유저의 id와 각 날짜를 저장할 map
		HashMap<String, String> map = null;				
		// 하루 동안 총 소비한 칼로리 양을 저장하는 ArrayList
		ArrayList<Integer> calorieList = new ArrayList<Integer>();
		// Controller로 리턴될 소비 칼로리 리스트
	    ArrayList<HashMap<String, Object>> consumptionList = new ArrayList<HashMap<String, Object>>();	
	    
	    // 음식을 소비한 날짜들을 받아옴
	    List<String> dateList = calendarDAO.getAllDateConsumptionCalorie(id);	
	    
	    // 일일 칼로리 총 섭취량을 구하기 위한 반복문들
	    for (int i=0; i<dateList.size(); i++) {
	    	map = new HashMap<String, String>();
	    	map.put("id", id);
	    	map.put("date", dateList.get(i));
	    	int calorieOfDay = calendarDAO.getTotalConsumptionCalorieOfDay(map);
	    	calorieList.add(calorieOfDay);
	    }
	    for (int i=0; i<dateList.size(); i++) {
	    	eventObject = new HashMap<String, Object>();
	    	eventObject.put("title", "총소비량 : " + calorieList.get(i));
	    	eventObject.put("start", dateList.get(i));
	    	eventObject.put("url", "user_calendar.do");
	    	consumptionList.add(eventObject);
	    }
		return consumptionList;
	}
}
