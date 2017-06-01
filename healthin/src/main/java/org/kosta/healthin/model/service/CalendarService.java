package org.kosta.healthin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

public interface CalendarService {
	// 달력에 각 일별로 총 섭취한 칼로리량을 나타내기 위한 method
	ArrayList<HashMap<String, Object>> getIntakeCalorieForMonth(String id);
	// 달력에 각 일별로 총 소비한 칼로리량을 나타내기 위한 method
	ArrayList<HashMap<String, Object>> getConsumptionCalorieForMonth(String id);
	
	// 아래 : 기존 서비스 인터페이스
	/*//int getTotalIntakeCalorieOfMonth(String id);					// 한달 동안 총 섭취한 칼로리
	int getTotalIntakeCalorieOfDay(HashMap<String, String> map);		// 하루 동안 총 섭취한 칼로리
	//List<VO> getAllIntakeFood(HashMap<String, String> map);	// 유저가 섭취한 모든 음식의 정보 출력
	List<String> getAllDateIntakeFood(String id);	// 유저가 칼로리를 섭취한 날짜 리스트 출력
	//getAllIntakeFood
	//getTotalIntakeCalorie
*/}
