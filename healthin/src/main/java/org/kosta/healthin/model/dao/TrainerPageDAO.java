package org.kosta.healthin.model.dao;

import java.util.List;
import java.util.Map;

import org.kosta.healthin.model.vo.VO;

public interface TrainerPageDAO {

	List<VO> trainerPtList(Map<String, Object> map);

	int getFollowerTotalCount(String id);

	List<VO> getFollowerList(Map<String, Object> map);

	List<VO> trainerMatchingList(Map<String, Object> map);

	int trainerPtListCount(String id);

	int trainerMatchingListCount(String id);

	void trainerMatcingUpdate(Map<String, Object> map);

}
