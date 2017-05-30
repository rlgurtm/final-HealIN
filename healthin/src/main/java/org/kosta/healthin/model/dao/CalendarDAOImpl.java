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
	public List<VO> getIntakeMember(HashMap<String, String> map) {
		return template.selectList("calendar.getIntakeMember", map);
	}
}
