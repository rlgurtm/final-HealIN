package org.kosta.healthin.model.dao;

import java.util.List;
import java.util.Map;

import org.kosta.healthin.model.vo.VO;

public interface TrainerPageDAO {

	List<VO> trainerPtList(String id);

	int getFollowerTotalCount(String id);

	List<VO> getFollowerList(Map<String, Object> map);

}
