package org.kosta.healthin.model.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.healthin.model.dao.CalorieGraphDAO;
import org.springframework.stereotype.Service;

@Service
public class CalorieGraphServiceImpl implements CalorieGraphService {
	@Resource
	private CalorieGraphDAO calorieGraphDAO;

	/*@Override
	public List<HashMap<String, Object>> getDataOfPeriod(HashMap<String, String> map) {
		return calorieGraphDAO.getDataOfPeriod(map);
	}*/

	@Override
	public List<String> getAllDateIntakeCalorie(String id) {
		return calorieGraphDAO.getAllDateIntakeCalorie(id);
	}

	@Override
	public int getTotalIntakeCalorieOfDay(HashMap<String, String> map) {
		return calorieGraphDAO.getTotalIntakeCalorieOfDay(map);
	}

	@Override
	public List<String> getAllDateConsumptionCalorie(String id) {
		return calorieGraphDAO.getAllDateConsumptionCalorie(id);
	}

	@Override
	public int getTotalConsumptionCalorieOfDay(HashMap<String, String> map) {
		System.out.println("service "+map);
		return calorieGraphDAO.getTotalConsumptionCalorieOfDay(map);
	}
}
