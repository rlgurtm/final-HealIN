package org.kosta.healthin.model.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.healthin.model.dao.CalendarDAO;
import org.springframework.stereotype.Service;

@Service
public class CalendarServiceImpl implements CalendarService {
	@Resource
	private CalendarDAO calendarDAO;

	@Override
	public List<String> getAllDateIntakeFood(String id) {
		return calendarDAO.getAllDateIntakeFood(id);
	}

	@Override
	public int getTotalIntakeCalorieOfDay(HashMap<String, String> map) {
		return calendarDAO.getTotalIntakeCalorieOfDay(map);
	}
}
