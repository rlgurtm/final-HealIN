package org.kosta.healthin.model.dao;

import java.util.HashMap;
import java.util.List;

public interface CalorieGraphDAO {
	//List<HashMap<String, Object>> getDataOfPeriod(HashMap<String, String> map);
	List<String> getAllDateIntakeCalorie(String id);	// 유저가 칼로리를 섭취한 날짜 리스트 출력
	int getTotalIntakeCalorieOfDay(HashMap<String, String> map);		// 하루 동안 총 섭취한 칼로리
	List<String> getAllDateConsumptionCalorie(String id);	// 유저가 칼로리를 소비한 날짜 리스트 출력
	int getTotalConsumptionCalorieOfDay(HashMap<String, String> map);	// 하루 동안 총 소비한 칼로리
}
