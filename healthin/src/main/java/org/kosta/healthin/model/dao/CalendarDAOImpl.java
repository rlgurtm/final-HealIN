package org.kosta.healthin.model.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.healthin.model.vo.DoneExerciseVO;
import org.kosta.healthin.model.vo.IntakeFoodVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class CalendarDAOImpl implements CalendarDAO {
	@Resource
	private SqlSessionTemplate template;

	@Override
	public List<String> getAllDateIntakeCalorie(String id) {
		return template.selectList("calendar.getAllDateIntakeCalorie", id);
	}

	@Override
	public int getTotalIntakeCalorieOfDay(HashMap<String, String> map) {
		return template.selectOne("calendar.getTotalIntakeCalorieOfDay", map);
	}

	@Override
	public List<String> getAllDateConsumptionCalorie(String id) {
		return template.selectList("calendar.getAllDateConsumptionCalorie", id);
	}

	@Override
	public int getTotalConsumptionCalorieOfDay(HashMap<String, String> map) {
		return template.selectOne("calendar.getTotalConsumptionCalorieOfDay", map);
	}

	@Override
	public List<IntakeFoodVO> getAllIntakeFood(HashMap<String, String> map) {
		return template.selectList("calendar.getAllIntakeFood", map);
	}

	@Override
	public List<String> getAllFoodCategory() {
		return template.selectList("calendar.getAllFoodCategory");
	}

	@Override
	public void deleteFood(int intakeNo) {
		template.delete("calendar.deleteFood", intakeNo);
	}

	@Override
	public List<String> getFoodsByCategory(String foodCategory) {
		return template.selectList("calendar.getFoodsByCategory", foodCategory);
	}

	@Override
	public void insertFood(HashMap<String, Object> map) {
		template.insert("calendar.insertFood", map);
	}

	@Override
	public void updateFood(HashMap<String, Object> map) {
		template.update("calendar.updateFood", map);
	}

	@Override
	public IntakeFoodVO getFoodByIntakeNo(int intakeNo) {
		return template.selectOne("calendar.getFoodByIntakeNo", intakeNo);
	}

	@Override
	public List<DoneExerciseVO> getAllDoneExercise(HashMap<String, String> map) {
		return template.selectList("calendar.getAllDoneExercise", map);
	}

	@Override
	public List<String> getAllExerciseCategory() {
		return template.selectList("calendar.getAllExerciseCategory");
	}

	@Override
	public void deleteExercise(int consumptionNo) {
		template.delete("calendar.deleteExercise", consumptionNo);
	}

	@Override
	public void insertExercise(HashMap<String, Object> map) {
		template.insert("calendar.insertExercise", map);
	}

	@Override
	public void updateExercise(HashMap<String, Object> map) {
		template.update("calendar.updateExercise", map);
	}

	@Override
	public List<String> getExercisesByCategory(String exerciseCategory) {
		return template.selectList("calendar.getExercisesByCategory", exerciseCategory);
	}

	@Override
	public DoneExerciseVO getExerciseByConsumptionNo(int consumptionNo) {
		return template.selectOne("calendar.getFoodByConsumptionNo", consumptionNo);
	}
}
