package org.kosta.healthin.model.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class CalorieGraphDAOImpl implements CalorieGraphDAO {
	@Resource
	private SqlSessionTemplate template;

	/*@Override
	public List<HashMap<String, Object>> getDataOfPeriod(HashMap<String, String> map) {
		return template.selectList("calorieGraph.getDataOfPeriod", map);
	}*/

	@Override
	public List<String> getAllDateIntakeCalorie(String id) {
		return template.selectList("calorieGraph.getAllDateIntakeCalorie", id);
	}

	@Override
	public int getTotalIntakeCalorieOfDay(HashMap<String, String> map) {
		return template.selectOne("calorieGraph.getTotalIntakeCalorieOfDay", map);
	}
	
	@Override
	public List<String> getAllDateConsumptionCalorie(String id) {
		return template.selectList("calorieGraph.getAllDateConsumptionCalorie", id);
	}

	@Override
	public int getTotalConsumptionCalorieOfDay(HashMap<String, String> map) {
		return template.selectOne("calorieGraph.getTotalConsumptionCalorieOfDay", map);
	}
}
