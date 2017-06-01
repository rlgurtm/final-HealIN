package org.kosta.healthin.model.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

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
}
