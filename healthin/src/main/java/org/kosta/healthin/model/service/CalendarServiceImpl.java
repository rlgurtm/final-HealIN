package org.kosta.healthin.model.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.healthin.model.dao.CalendarDAO;
import org.kosta.healthin.model.vo.VO;
import org.springframework.stereotype.Service;

@Service
public class CalendarServiceImpl implements CalendarService {
	@Resource
	private CalendarDAO calendarDAO;
	
	@Override
	public int getIntakeCalorieOfMember(HashMap<String, String> map) {
		int totalCalorie = 0;
		List<VO> list = calendarDAO.getIntakeMember(map);
		System.out.println(list);
		return totalCalorie;
	}
}
