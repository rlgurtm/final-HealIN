package org.kosta.healthin.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.kosta.healthin.model.vo.DoneExerciseVO;
import org.kosta.healthin.model.vo.IntakeFoodVO;

public interface CalendarService {
	// 달력에 각 일별로 총 섭취한 칼로리량을 나타내기 위한 method
	ArrayList<HashMap<String, Object>> getIntakeCalorieForMonth(String id);
	List<IntakeFoodVO> getAllIntakeFood(HashMap<String, String> map);	// 유저가 섭취한 모든 음식의 정보 출력
	List<String> getAllDateIntakeCalorie(String id);			// 유저가 칼로리를 섭취한 날짜 리스트 출력
	List<String> getAllFoodCategory();		// 음식의 카테고리 정보 출력
	void deleteFood(int intakeNo);	// 먹은 음식 삭제
	void insertFood(HashMap<String, Object> map);	// 먹은 음식 추가
	void updateFood(HashMap<String, Object> map);	// 먹은 음식 수정
	List<String> getFoodsByCategory(String foodCategory);	// 모든 음식 리스트 출력 
	IntakeFoodVO getFoodByIntakeNo(int intakeNo);	// 섭취 번호에 따른 음식 정보 
	
	// 달력에 각 일별로 총 소비한 칼로리량을 나타내기 위한 method
	ArrayList<HashMap<String, Object>> getConsumptionCalorieForMonth(String id);
	List<DoneExerciseVO> getAllDoneExercise(HashMap<String, String> map);	// 유저가 한 모든 운동 리스트 출력
	List<String> getAllDateConsumptionCalorie(String id);	// 유저가 칼로리를 소비한 날짜 리스트 출력
	List<String> getAllExerciseCategory();		// 운동의 카테고리 정보 출력
	void deleteExercise(int consumptionNo);	// 한 운동 삭제
	void insertExercise(HashMap<String, Object> map);	// 한 운동 추가
	void updateExercise(HashMap<String, Object> map);	// 한 운동 수정
	List<String> getExercisesByCategory(String exerciseCategory);		// 모든 운동 리스트 출력 
	DoneExerciseVO getExerciseByConsumptionNo(int consumptionNo);	// 운동 번호에 따른 운동 정보
}
