package org.kosta.healthin.model.service;

import java.util.HashMap;
import java.util.List;

public interface CalendarService {
	//int getTotalIntakeCalorieOfMonth(String id);					// 한달 동안 총 섭취한 칼로리
	int getTotalIntakeCalorieOfDay(HashMap<String, String> map);		// 하루 동안 총 섭취한 칼로리
	//List<VO> getAllIntakeFood(HashMap<String, String> map);	// 유저가 섭취한 모든 음식의 정보 출력
	List<String> getAllDateIntakeFood(String id);	// 유저가 칼로리를 섭취한 날짜 리스트 출력
	//getAllIntakeFood
	//getTotalIntakeCalorie
}
