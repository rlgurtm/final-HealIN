package org.kosta.healthin.model.dao;

import java.util.HashMap;
import java.util.List;

import org.kosta.healthin.model.vo.VO;

public interface CalendarDAO {
	List<VO> getIntakeMember(HashMap<String, String> map);
}
