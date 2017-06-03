package org.kosta.healthin.model.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.healthin.model.vo.VO;
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
	public List<VO> getAllIntakeFood(HashMap<String, String> map) {
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

//	@Override
//	public void updateFood(HashMap<String, String> map) {
//		template.update("calendar.updateFood", intakeNo);
//	}
}
