package org.kosta.healthin.model.dao;

import java.util.HashMap;
import java.util.List;

import org.kosta.healthin.model.vo.VO;

public interface CalendarDAO {
	List<String> getAllDateIntakeCalorie(String id);	// 유저가 칼로리를 섭취한 날짜 리스트 출력
	int getTotalIntakeCalorieOfDay(HashMap<String, String> map);		// 하루 동안 총 섭취한 칼로리
	List<String> getAllDateConsumptionCalorie(String id);	// 유저가 칼로리를 소비한 날짜 리스트 출력
	int getTotalConsumptionCalorieOfDay(HashMap<String, String> map);	// 하루 동안 총 소비한 칼로리
	//int getTotalIntakeCalorieOfMonth(String id);					// 한달 동안 총 섭취한 칼로리
	List<VO> getAllIntakeFood(HashMap<String, String> map);	// 유저가 섭취한 모든 음식의 정보 출력
	List<String> getAllFoodCategory();		// 음식의 카테고리 정보 출력
	void deleteFood(int intakeNo);	// 먹은 음식 삭제
	void insertFood(HashMap<String, Object> map);	// 먹은 음식 추가
//	void updateFood(HashMap<String, String> map);	// 먹은 음식 수정
	List<String> getFoodsByCategory(String foodCategory);	// 모든 음식 리스트 출력 
}
